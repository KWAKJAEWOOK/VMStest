// VMScontroller.c

#include "VMScontroller.h"
#include "VMSprotocol.h"
#include "minIni.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

// 헬퍼 함수 프로토타입 (Forward Declarations) 추가
static double calculate_bearing(double lat1, double lon1, double lat2, double lon2);
static double find_closest_bearing(const double* target_bearings, int count, double bearing);
static double get_closest_target_bearing(
    const double* target_bearings, int target_count,
    double lat_c, double lon_c,
    double lat_p, double lon_p
);
static int Change_CVIBDirCode(int cvibDirCode);

bool vms_controller_load_config(const char* config_filepath, VMS_TextParamConfig_t* out_config) {
    if (!config_filepath || !out_config) return false;

    // 구조체 멤버를 기본값 또는 빈 문자열로 초기화
    memset(out_config, 0, sizeof(VMS_TextParamConfig_t));

    const char* section = "텍스트 프로토콜 파라미터"; // INI 파일의 섹션 이름
    // ini_gets(section, key, default_value, buffer, buffer_size, filename)
    ini_gets(section, "RST", "1", out_config->rst, sizeof(out_config->rst), config_filepath);
    ini_gets(section, "SPD", "3", out_config->spd, sizeof(out_config->spd), config_filepath);
    ini_gets(section, "NEN", "0", out_config->nen, sizeof(out_config->nen), config_filepath);
    ini_gets(section, "LNE", "1", out_config->lne, sizeof(out_config->lne), config_filepath);
    ini_gets(section, "YSZ", "2", out_config->ysz, sizeof(out_config->ysz), config_filepath);
    ini_gets(section, "EFF", "090009000900", out_config->eff, sizeof(out_config->eff), config_filepath);
    ini_gets(section, "DLY", "3", out_config->dly, sizeof(out_config->dly), config_filepath);
    ini_gets(section, "FIX", "1", out_config->fix, sizeof(out_config->fix), config_filepath);
    ini_gets(section, "DEFALT_FONT", "$f02", out_config->default_font, sizeof(out_config->default_font), config_filepath);
    ini_gets(section, "DEFAULT_COLOR", "$c00", out_config->default_color, sizeof(out_config->default_color), config_filepath);

    const char* coord_section = "기준 좌표";
    // ini_getf(section, key, default_value, filename)
    out_config->center_latitude = (double)ini_getf(coord_section, "CenterLatitude", 0.0, config_filepath);
    out_config->center_longitude = (double)ini_getf(coord_section, "CenterLongitude", 0.0, config_filepath);
    return true;
}

/**
 * @brief VMS_MessageList_t에 전송할 메시지 정보를 추가/병합합니다.
 * 동일한 페이로드가 이미 리스트에 있으면 대상 그룹 ID만 추가하고, 없으면 새 항목을 생성합니다.
 * @param list 메시지를 추가할 VMS_MessageList_t 포인터.
 * @param payload_str 추가할 페이로드 문자열.
 * @param group_id_to_add 추가할 대상 그룹 ID.
 * @param command_type VMS 프로토콜 명령어 타입.
 */
static void add_message_to_list(VMS_MessageList_t* list, const char* payload_str, int group_id_to_add, uint8_t command_type) {
    if (!list || !payload_str) return;

    // 1. 동일한 페이로드가 이미 리스트에 있는지 확인
    for (int i = 0; i < list->count; ++i) {
        if (strcmp(list->messages[i].payload_str, payload_str) == 0) {
            // 동일 페이로드 발견 시 대상 그룹 ID 배열에 group_id_to_add가 이미 있는지 확인
            bool group_exists = false;
            for (int j = 0; j < list->messages[i].num_target_groups; ++j) {
                if (list->messages[i].target_group_ids[j] == group_id_to_add) {
                    group_exists = true;
                    break;
                }
            }
            // 그룹 ID가 아직 없으면 배열을 확장하고 추가
            if (!group_exists) {
                list->messages[i].num_target_groups++;
                int* new_ids = (int*)realloc(list->messages[i].target_group_ids, sizeof(int) * list->messages[i].num_target_groups);
                if (!new_ids) {
                    perror("Failed to realloc target_group_ids");
                    list->messages[i].num_target_groups--; // 실패 시 원상복구
                    return;
                }
                list->messages[i].target_group_ids = new_ids;
                list->messages[i].target_group_ids[list->messages[i].num_target_groups - 1] = group_id_to_add;
            }
            return;
        }
    }

    // 2. 동일한 페이로드가 없으면 새로 추가
    list->count++;
    VMS_MessageToSend_t* new_message_array = (VMS_MessageToSend_t*)realloc(list->messages, sizeof(VMS_MessageToSend_t) * list->count);
    if (!new_message_array) {
        perror("Failed to realloc VMS_MessageToSend_t array");
        list->count--;
        return;
    }
    list->messages = new_message_array;

    // 새 메시지 항목 초기화
    VMS_MessageToSend_t* new_msg = &list->messages[list->count - 1];
    new_msg->payload_str = strdup(payload_str); // 문자열 복제
    new_msg->num_target_groups = 1;
    new_msg->target_group_ids = (int*)malloc(sizeof(int));
    if (!new_msg->payload_str || !new_msg->target_group_ids) {
        perror("Failed to allocate memory for new message item");
        // 메모리 해제 등 오류 처리
        if (new_msg->payload_str) free(new_msg->payload_str);
        if (new_msg->target_group_ids) free(new_msg->target_group_ids);
        list->count--;
        return;
    }
    new_msg->target_group_ids[0] = group_id_to_add;
    new_msg->command_type = command_type;
}

// 메시지 결정 로직의 기본 틀
VMS_MessageList_t* vms_controller_determine_messages(
    const SdsJson_MainMessage_t* parsed_message,
    const VMS_TextParamConfig_t* text_config
) {
    if (!parsed_message || !text_config) return NULL;

    // 반환할 메시지 리스트 초기화
    VMS_MessageList_t* message_list = (VMS_MessageList_t*)calloc(1, sizeof(VMS_MessageList_t));
    if (!message_list) {
        perror("Failed to allocate VMS_MessageList_t");
        return NULL;
    }
    // message_list->messages는 필요에 따라 realloc으로 확장
    // message_list->count는 추가될 때마다 증가

    printf("[VMSController] Determining messages for MsgCount: %d, Timestamp: %s\n",
           parsed_message->msg_count, parsed_message->timestamp);

    char payload_buffer[1024]; // 페이로드 생성을 위한 임시 버퍼

    // 1. ApproachTrafficInfoList 순회
    for (int i = 0; i < parsed_message->num_approach_traffic_info; ++i) {
        const SdsJson_ApproachTrafficInfoData_t* ati = &parsed_message->approach_traffic_info_list[i];
        printf("  Processing ApproachTrafficInfo item %d: CVIBDirCode = %d\n", i, ati->cvib_dir_code);

        // 1.1. CVIBDirCode 확인
        int first_target_group_id_related_to_cvib = ati->cvib_dir_code;
        int first_cvib_degree = Change_CVIBDirCode(first_target_group_id_related_to_cvib);

        // 1.2. HostObject의 WayPointList 확인
        if (ati->host_object.num_way_points > 0) {
            const SdsJson_WayPoint_t* first_wp = &ati->host_object.way_point_list[0];
            const SdsJson_WayPoint_t* last_wp = &ati->host_object.way_point_list[ati->host_object.num_way_points - 1];

            // WayPoint를 통한 특정 그룹 번호(방위각) 추정
            double targets[] = {45, 135, 225, 315}; // 타겟 그룹 번호(방위각) 리스트 예시
            double lat_c = text_config->center_latitude;
            double lon_c = text_config->center_longitude;

            int group_for_first_wp = (int)get_closest_target_bearing(targets, 4, lat_c, lon_c, first_wp->lat, first_wp->lon);
            if (first_cvib_degree != group_for_first_wp) { printf("방향코드불일치.\n방향코드 방위각:%d\nGPS 방위각:%d\n",first_cvib_degree,group_for_first_wp); }
            int first_wp_group_id = group_for_first_wp; // config.ini 파일을 통해 first_cvib_degree로 실행하도록 변경 가능하도록 할 예정

            snprintf(payload_buffer, sizeof(payload_buffer),
                     "RST=%s,SPD=%s,NEN=%s,LNE=%s,YSZ=%s,EFF=%s,DLY=%s,FIX=%s,TXT=%s%s차량 접근(Dir:%d,Speed:%.1f)",
                     text_config->rst, text_config->spd, text_config->nen, text_config->lne, text_config->ysz,
                     text_config->eff, text_config->dly, text_config->fix,
                     text_config->default_font, text_config->default_color,
                     ati->cvib_dir_code, first_wp->speed);
            add_message_to_list(message_list, payload_buffer, first_wp_group_id, CMD_TYPE_INSERT);
            // 추가 로직: result1 + 1000 값의 그룹에도 차량 진입 메세지 전송
            add_message_to_list(message_list, "RST=1,LNE=1,TXT=$c01차량 진입", first_wp_group_id + 1000, CMD_TYPE_INSERT);

            int group_for_last_wp = (int)get_closest_target_bearing(targets, 4, lat_c, lon_c, last_wp->lat, last_wp->lon);
            snprintf(payload_buffer, sizeof(payload_buffer),
                     "RST=%s,SPD=%s,NEN=%s,LNE=%s,YSZ=%s,EFF=%s,DLY=%s,FIX=%s,TXT=%s%s차량 통과 예상(Dir:%d,Speed:%.1f)",
                     text_config->rst, text_config->spd, text_config->nen, text_config->lne, text_config->ysz,
                     text_config->eff, text_config->dly, text_config->fix,
                     text_config->default_font, text_config->default_color,
                     ati->cvib_dir_code, last_wp->speed);
            add_message_to_list(message_list, payload_buffer, group_for_last_wp, CMD_TYPE_INSERT);
        }
    }
    // 2. ConflictPos 확인 및 관련 메시지 생성
    for (int i = 0; i < parsed_message->num_approach_traffic_info; ++i) {
        const SdsJson_ApproachTrafficInfoData_t* ati = &parsed_message->approach_traffic_info_list[i];
        
        // ConflictPos와 RemoteObject가 모두 존재할 때 충돌 상황으로 판단
        if (ati->conflict_pos && ati->remote_object) {
            printf("  ConflictPos found in ATI item %d: lat=%.7f, lon=%.7f\n",
                   i, ati->conflict_pos->lat, ati->conflict_pos->lon);
            
            // HostObject와 RemoteObject 모두 WayPoint 정보가 있는지 확인
            if (ati->host_object.num_way_points > 0 && ati->remote_object->num_way_points > 0) {
                const SdsJson_WayPoint_t* host_wp = &ati->host_object.way_point_list[0];

                double targets[] = {45, 135, 225, 315}; // 타겟 그룹 번호(방위각) 리스트 예시
                double lat_c = text_config->center_latitude;
                double lon_c = text_config->center_longitude;

                // 1. HostObject의 접근 그룹 결정
                int group_for_host = (int)get_closest_target_bearing(targets, 4, lat_c, lon_c, host_wp->lat, host_wp->lon);
                
                // 3. 경고 페이로드 생성
                snprintf(payload_buffer, sizeof(payload_buffer),
                         "RST=%s,SPD=%s,NEN=%s,LNE=%s,YSZ=%s,EFF=%s,DLY=%s,FIX=%s,TXT=$c01충돌 주의! (PET:%.2f)",
                         text_config->rst, text_config->spd, text_config->nen, text_config->lne, text_config->ysz,
                         text_config->eff, text_config->dly, text_config->fix,
                         ati->has_pet ? ati->pet : 0.0);
                
                // 4. 경고 메시지 추가
                add_message_to_list(message_list, payload_buffer, group_for_host, CMD_TYPE_INSERT);
                add_message_to_list(message_list, payload_buffer, group_for_host+1000, CMD_TYPE_INSERT);

            } else {
                fprintf(stderr, "  Warning: ConflictPos found but Host or Remote object has no waypoints.\n");
            }
        }
    }

    return message_list;
}

void free_vms_message_list(VMS_MessageList_t* message_list) {
    if (!message_list) return;
    if (message_list->messages) {
        for (int i = 0; i < message_list->count; ++i) {
            if (message_list->messages[i].payload_str) {
                free(message_list->messages[i].payload_str);
            }
            if (message_list->messages[i].target_group_ids) {
                free(message_list->messages[i].target_group_ids);
            }
        }
        free(message_list->messages);
    }
    free(message_list);
}


// 첫 번째 웨이포인트 값을 통해 그룹 번호(방위각)를 결정하는 헬퍼 함수
#define DEG2RAD(deg) ((deg) * M_PI / 180.0)
#define RAD2DEG(rad) ((rad) * 180.0 / M_PI)

// 방위각 계산 함수
double calculate_bearing(double lat1, double lon1, double lat2, double lon2) {
    double dLon = DEG2RAD(lon2 - lon1);
    lat1 = DEG2RAD(lat1);
    lat2 = DEG2RAD(lat2);

    double y = sin(dLon) * cos(lat2);
    double x = cos(lat1) * sin(lat2) -
               sin(lat1) * cos(lat2) * cos(dLon);
    double brng = atan2(y, x);
    brng = RAD2DEG(brng);
    brng = fmod((brng + 360.0), 360.0);  // Normalize to 0–360
    // printf("방위각 계산 결과: %f\n", brng);
    return brng;
}

// 가장 가까운 방위각 찾기
double find_closest_bearing(const double* target_bearings, int count, double bearing) {
    double closest = target_bearings[0];
    double min_diff = fabs(bearing - closest);
    if (min_diff > 180) min_diff = 360 - min_diff;

    for (int i = 1; i < count; ++i) {
        double diff = fabs(bearing - target_bearings[i]);
        if (diff > 180) diff = 360 - diff; // circular distance

        if (diff < min_diff) {
            min_diff = diff;
            closest = target_bearings[i];
        }
    }

    return closest;
}

// 통합 헬퍼 함수
double get_closest_target_bearing(
    const double* target_bearings, int target_count,
    double lat_c, double lon_c,
    double lat_p, double lon_p
) {
    double bearing = calculate_bearing(lat_c, lon_c, lat_p, lon_p);
    return find_closest_bearing(target_bearings, target_count, bearing);
}

// CVIBDirCode 방위각 변환 함수
int Change_CVIBDirCode(int cvib_code_id) {
    switch (cvib_code_id) {
        case 10:
            return 0;
        case 50:
            return 45;
        case 20:
            return 90;
        case 60:
            return 135;
        case 30:
            return 180;
        case 70:
            return 225;
        case 40:
            return 270;
        case 80:
            return 315;
        default:
            return -1;
    }
}
