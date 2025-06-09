#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <pthread.h>

#include <sys/socket.h>
#include <errno.h>

#include "VMSconnection_manager.h"
#include "VMSprotocol.h"
#include "sds_json_types.h"
#include "VMScontroller.h"
// #include "cJSON.h"

// 스레드 종료를 제어하기 위한 전역 변수 (또는 VMSData 구조체에 포함 가능)
volatile int keep_running_manager = 1;

// vms_manager_manage_connections를 실행할 스레드 함수
void* connection_manager_thread_func(void* arg) {
    VMSServers* servers = (VMSServers*)arg;
    printf("[Thread] Connection manager thread started.\n");
    vms_manager_manage_connections(servers);
    printf("[Thread] Connection manager thread finishing.\n");
    return NULL;
}

// 특정 그룹의 모든 연결된 서버에게 메시지를 전송하는 함수 (뮤텍스 사용)
void send_message_to_group_thread_safe(VMSServers* all_servers, int target_group_id, const char* message, size_t message_len) {
    if (!all_servers || !message || message_len == 0) {
        fprintf(stderr, "[Sender] 잘못된 인자입니다.\n");
        return;
    }

    // 공유 데이터 접근 전 뮤텍스 잠금
    pthread_mutex_lock(&all_servers->mutex);

    VMSServerGroup* group_to_send = NULL;
    for (int i = 0; i < all_servers->num_groups; ++i) {
        if (all_servers->groups[i].group_id == target_group_id) {
            group_to_send = &all_servers->groups[i];
            break;
        }
    }

    if (!group_to_send) {
        fprintf(stderr, "[Sender] 그룹 ID %d 를 찾을 수 없습니다.\n", target_group_id);
        pthread_mutex_unlock(&all_servers->mutex); // 리턴 전 반드시 잠금 해제
        return;
    }

    printf("[Sender] 그룹 %d (%d개 서버)에 메시지 전송 시도 (뮤텍스 잠금 상태)...\n",
           target_group_id, group_to_send->num_servers);

    for (int i = 0; i < group_to_send->num_servers; ++i) {
        VMSServerInfo* server = &group_to_send->servers[i];
        int current_socket_handle = server->socket_handle; // 핸들 값 복사

        if (current_socket_handle != -1) {
            printf("[Sender]   -> %s:%d (그룹 %d, 핸들: %d) 에 전송 중...\n",
                   server->ip_address, server->port, server->group_id_for_log, current_socket_handle);

            ssize_t total_bytes_sent = 0;
            while ((size_t)total_bytes_sent < message_len) {
                ssize_t bytes_sent_this_call = send(current_socket_handle, // 복사된 핸들 사용
                                                    message + total_bytes_sent,
                                                    message_len - total_bytes_sent,
                                                    MSG_NOSIGNAL);

                if (bytes_sent_this_call < 0) {
                    fprintf(stderr, "[Sender]   ERROR: %s:%d 로 전송 실패 (에러: %s).\n",
                           server->ip_address, server->port, strerror(errno));
                    if(server->socket_handle == current_socket_handle) { // 아직 매니저가 바꾸지 않았다면
                        close(server->socket_handle);
                        server->socket_handle = -1;
                    }
                    break; 
                } else if (bytes_sent_this_call == 0) {
                     fprintf(stderr, "[Sender]   WARNING: %s:%d 로 전송 시 0 바이트 전송됨.\n",
                           server->ip_address, server->port);
                    if(server->socket_handle == current_socket_handle) {
                        close(server->socket_handle);
                        server->socket_handle = -1;
                    }
                    break;
                }
                total_bytes_sent += bytes_sent_this_call;
            }
            if ((size_t)total_bytes_sent == message_len) {
                printf("[Sender]   SUCCESS: %s:%d 로 %ld 바이트 전송 완료.\n",
                       server->ip_address, server->port, total_bytes_sent);
            }
        } else {
            printf("[Sender]   SKIP: %s:%d (그룹 %d)는 연결되지 않음 (핸들: -1).\n",
                   server->ip_address, server->port, server->group_id_for_log);
        }
    }
    // 모든 작업 완료 후 뮤텍스 잠금 해제
    pthread_mutex_unlock(&all_servers->mutex);
}

// 파일 내용을 읽어 문자열 버퍼로 반환
char* read_json_file_to_string(const char* filename) {
    FILE *file = NULL;
    char *buffer = NULL;
    long file_size;
    size_t read_size;

    file = fopen(filename, "rb");
    if (file == NULL) {
        fprintf(stderr, "Error opening JSON file '%s': %s\n", filename, strerror(errno));
        return NULL;
    }
    fseek(file, 0, SEEK_END);
    file_size = ftell(file);
    if (file_size < 0) {
        perror("Error getting file size");
        fclose(file);
        return NULL;
    }
    rewind(file);
    buffer = (char*)malloc(file_size + 1);
    if (buffer == NULL) {
        perror("Failed to allocate memory for JSON string buffer");
        fclose(file);
        return NULL;
    }
    read_size = fread(buffer, 1, file_size, file);
    if (read_size != (size_t)file_size) {
        perror("Failed to read entire JSON file");
        free(buffer);
        fclose(file);
        return NULL;
    }
    buffer[file_size] = '\0';
    fclose(file);
    return buffer;
}

int main (int argc, char** argv)
{
    pthread_t conn_manager_tid; // 스레드 ID

    const char* ini_file_name = "vms_servers.ini";
    VMSServers* vms_servers = vms_manager_init(ini_file_name); // 여기서 뮤텍스 초기화됨

    if (vms_servers == NULL) {
        fprintf(stderr, "VMS 매니저 초기화 실패. 프로그램 종료\n");
        return 1;
    }
    printf("VMS 매니저 초기화 성공. 총 설정된 서버 수: %d, 그룹 수: %d\n",
           vms_servers->total_servers_configured, vms_servers->num_groups);

    // 연결 관리자 스레드 생성
    if (pthread_create(&conn_manager_tid, NULL, connection_manager_thread_func, vms_servers) != 0) {
        perror("Failed to create connection manager thread");
        vms_manager_cleanup(vms_servers); // 뮤텍스도 여기서 destroy됨
        return 1;
    }
    sleep(10);

    // 1. JSON 파일 읽고 파싱 (테스트용)
    const char* json_test_filename = "testjson.json"; // bin 디렉토리에 있는 JSON 파일
    char* json_string = read_json_file_to_string(json_test_filename);

    // 2. config.ini 파일 로드
    VMS_TextParamConfig_t text_config;
    if (!vms_controller_load_config("config.ini", &text_config)) { // bin 디렉토리에 있는 INI 파일
        fprintf(stderr, "Failed to load config.ini. Aborting message sending.\n");
    } else if (json_string) {
        // 3. JSON 파싱
        SdsJson_MainMessage_t* parsed_message = sds_json_parse_message(json_string);
        if (parsed_message) {
            // 4. 전송할 메시지 결정
            VMS_MessageList_t* message_list = vms_controller_determine_messages(parsed_message, &text_config);
            if (message_list) {
                // 5. 디버깅용 메시지 리스트 출력
                // printf("\n--- Determined Message List to Send ---\n");
                // for (int i = 0; i < message_list->count; ++i) {
                //     VMS_MessageToSend_t* msg = &message_list->messages[i];
                //     printf("Message #%d:\n", i + 1);
                //     printf("  Payload: \"%s\"\n", msg->payload_str);
                //     printf("  Target Groups: ");
                //     for (int j = 0; j < msg->num_target_groups; ++j) {
                //         printf("%d ", msg->target_group_ids[j]);
                //     }
                //     printf("\n---------------------------------------\n");
                // }

                // 6. 리스트를 순회하며 메시지 전송
                for (int i = 0; i < message_list->count; ++i) {
                    VMS_MessageToSend_t* msg = &message_list->messages[i];
                    for (int j = 0; j < msg->num_target_groups; ++j) {
                        int group_id = msg->target_group_ids[j];
                        
                        // 페이로드를 VMS 프로토콜 패킷으로 변환
                        uint16_t packet_len = 0;
                        uint8_t* packet_data = create_text_control_packet(msg->command_type, msg->payload_str, &packet_len);

                        if (packet_data && packet_len > 0) {
                            printf("==> Sending Payload to Group %d\n", group_id);
                            send_message_to_group_thread_safe(vms_servers, group_id, (const char*)packet_data, packet_len);
                            free(packet_data); // 패킷 데이터 해제
                        }
                    }
                }
                // 7. 메시지 리스트 해제
                free_vms_message_list(message_list);
            }
            // JSON 데이터 구조체 해제
            free_sds_json_main_message(parsed_message);
        }
        free(json_string); // 문자열 버퍼 해제
    }

    printf("메인 스레드: 작업 완료. 연결 관리자 스레드 종료 요청...\n");
    keep_running_manager = 0; // 스레드 종료 플래그 설정

    // 연결 관리자 스레드가 종료될 때까지 대기
    if (pthread_join(conn_manager_tid, NULL) != 0) {
        perror("Failed to join connection manager thread");
    } else {
        printf("메인 스레드: Connection manager thread joined successfully.\n");
    }

    vms_manager_cleanup(vms_servers); // 뮤텍스도 여기서 destroy됨
    printf("모든 작업 완료. 프로그램 종료.\n");

    return 0;
}
