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

    // 테스트: 5초마다 1번 그룹에 메시지 전송 (3번 반복) JSON 파싱 코드 테스트를 위해 일시적 주석 처리
    // printf("메인 스레드: 연결 관리자 대기 중...\n");
    // sleep(5);
    // for (int k = 0; k < 3; ++k) {
    //     usleep(100 * 1000); // 송신 대기 (100ms)
    //     // sprintf("메인 스레드 테스트 메시지 전송 #%d", k + 1);
    //     uint16_t text_packet_len = 0;
    //     uint8_t type = CMD_TYPE_INSERT;
    //     const char* data_payload1 = "RST=1,SPD=3,NEN=0,LNE=1,YSZ=2,EFF=090009000900,DLY=3,FIX=1,TXT=$f02$c00Test MSG1";
    //     uint8_t* packet_data_text1 = create_text_control_packet(type, data_payload1, &text_packet_len);
    //     if (packet_data_text1 != NULL && text_packet_len > 0)
    //     {
    //         send_message_to_group_thread_safe(vms_servers, 1, (const char*)packet_data_text1, text_packet_len);
    //         free(packet_data_text1); // 사용 후 반드시 해제
    //     }

    //     usleep(100 * 1000); // 송신 대기
    //     const char* data_payload2 = "RST=1,SPD=3,NEN=0,LNE=1,YSZ=2,EFF=090009000900,DLY=3,FIX=1,TXT=$f02$c00Test MSG2";
    //     uint8_t* packet_data_text2 = create_text_control_packet(type, data_payload2, &text_packet_len);
    //     if (packet_data_text2 != NULL && text_packet_len > 0)
    //     {
    //         send_message_to_group_thread_safe(vms_servers, 1, (const char*)packet_data_text2, text_packet_len);
    //         free(packet_data_text2); // 사용 후 반드시 해제
    //     }

    //     usleep(100 * 1000); // 송신 대기
    //     const char* data_payload3 = "RST=1,SPD=3,NEN=0,LNE=1,YSZ=2,EFF=090009000900,DLY=3,FIX=1,TXT=$f02$c00Test MSG3";
    //     uint8_t* packet_data_text3 = create_text_control_packet(type, data_payload3, &text_packet_len);
    //     if (packet_data_text3 != NULL && text_packet_len > 0)
    //     {
    //         send_message_to_group_thread_safe(vms_servers, 1, (const char*)packet_data_text3, text_packet_len);
    //         free(packet_data_text3); // 사용 후 반드시 해제
    //     }
    // }

    // JSON 파싱 테스트
    const char* json_test_filename = "testjson.json"; // bin 디렉토리
    char* json_string = read_json_file_to_string(json_test_filename);
    if (json_string) {
        SdsJson_MainMessage_t* parsed_message = sds_json_parse_message(json_string);
        if (parsed_message) {
            printf("JSON 파싱 성공!\n");
            printf("MsgCount: %d\n", parsed_message->msg_count);
            printf("Timestamp: %s\n", parsed_message->timestamp);
            printf("Number of ApproachTrafficInfo items: %d\n", parsed_message->num_approach_traffic_info);
            if (parsed_message->num_approach_traffic_info > 0 && parsed_message->approach_traffic_info_list) {
                // 테스트 출력
                SdsJson_ApproachTrafficInfoData_t* first_ati = &parsed_message->approach_traffic_info_list[2];
                printf("  First ATI - CVIBDirCode: %d\n", first_ati->cvib_dir_code);
                printf("  First ATI - PET_Threshold: %.1f\n", first_ati->pet_threshold);
                if (first_ati->has_pet) {
                    printf("  First ATI - PET: %.3f\n", first_ati->pet);
                }
                if (first_ati->conflict_pos) {
                     printf("  First ATI - ConflictPos Lat: %.7f, Lon: %.7f\n", first_ati->conflict_pos->lat, first_ati->conflict_pos->lon);
                }
                printf("  First ATI - HostObject ID: %s, Type: %s\n",
                       first_ati->host_object.object_id, first_ati->host_object.object_type);
                if (first_ati->host_object.num_way_points > 0 && first_ati->host_object.way_point_list) {
                    printf("    HostObject - First WayPoint Lat: %.7f, Lon: %.7f, Speed: %.3f\n",
                           first_ati->host_object.way_point_list[0].lat,
                           first_ati->host_object.way_point_list[0].lon,
                           first_ati->host_object.way_point_list[0].speed);
                }
            }
            free_sds_json_main_message(parsed_message); // 파싱된 데이터 구조체 해제
        } else {
            fprintf(stderr, "JSON 메시지 파싱 실패.\n");
        }
        free(json_string); // 파일에서 읽은 문자열 버퍼 해제
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
