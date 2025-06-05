// VMScontroller.c

#include "VMScontroller.h"
#include "VMSprotocol.h"
#include "minIni.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

bool vms_controller_load_config(const char* config_filepath, VMS_TextParamConfig_t* out_config) {
    if (!config_filepath || !out_config) return false;

    // 구조체 멤버를 기본값 또는 빈 문자열로 초기화 (선택적)
    memset(out_config, 0, sizeof(VMS_TextParamConfig_t));

    const char* section = "텍스트 프로토콜 파라미터"; // INI 파일의 섹션 이름

    // minIni 함수를 사용하여 각 파라미터 읽기
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

    // (디버깅용) 로드된 값 확인
    // printf("[VMSController] Config loaded from '%s':\n", config_filepath);
    // printf("  RST=%s, SPD=%s, EFF=%s, FONT=%s, COLOR=%s\n",
    //        out_config->rst, out_config->spd, out_config->eff, out_config->default_font, out_config->default_color);

    // ini_gets는 파일이 없거나 섹션/키가 없으면 기본값을 사용하거나 0을 반환(읽은 문자열 길이).
    // 여기서는 파일 존재 여부는 fopen 등으로 미리 확인했거나, minIni가 DefValue를 사용하므로 추가적인 오류 처리는 생략.
    // 필요하다면 ini_gets의 반환값(읽은 문자열 길이)을 확인하여 키 존재 여부 판단 가능.
    return true;
}

// 메시지 결정 로직의 기본 틀 (실제 로직은 추후 상세 구현)
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

    // 1. ApproachTrafficInfoList 순회
    for (int i = 0; i < parsed_message->num_approach_traffic_info; ++i) {
        const SdsJson_ApproachTrafficInfoData_t* ati = &parsed_message->approach_traffic_info_list[i];
        printf("  Processing ApproachTrafficInfo item %d: CVIBDirCode = %d\n", i, ati->cvib_dir_code);

        // 1.1. CVIBDirCode 확인 -> 그룹 번호와 관련된 값
        int first_target_group_id_related_to_cvib = ati->cvib_dir_code; // 실제 변환 로직 필요

        // 1.2. HostObject의 WayPointList 확인
        if (ati->host_object.num_way_points > 0) {
            const SdsJson_WayPoint_t* first_wp = &ati->host_object.way_point_list[0];
            const SdsJson_WayPoint_t* last_wp = &ati->host_object.way_point_list[ati->host_object.num_way_points - 1];

            printf("    HostObject First WP: lat=%.7f, lon=%.7f, speed=%.3f\n",
                   first_wp->lat, first_wp->lon, first_wp->speed);
            printf("    HostObject Last WP: lat=%.7f, lon=%.7f, speed=%.3f\n",
                   last_wp->lat, last_wp->lon, last_wp->speed);

            // 1.2.1. 첫 번째 메시지 (CVIBDirCode, HostObject 첫 WP 기반)
            //      - 대상 그룹 결정 로직 (예시: cvib_dir_code와 첫 WP 좌표로 실제 그룹 ID 목록 생성)
            //      - 페이로드 생성 로직 (TXT= 부분에 실제 상황 정보 포함)
            //      - message_list에 VMS_MessageToSend_t 추가
            // 예시 페이로드 생성:
            char temp_payload[512];
            snprintf(temp_payload, sizeof(temp_payload),
                     "RST=%s,SPD=%s,NEN=%s,LNE=%s,YSZ=%s,EFF=%s,DLY=%s,FIX=%s,TXT=%s%s첫번째 WP 정보 (Dir:%d, Speed:%.1f)",
                     text_config->rst, text_config->spd, text_config->nen, text_config->lne, text_config->ysz,
                     text_config->eff, text_config->dly, text_config->fix,
                     text_config->default_font, text_config->default_color,
                     ati->cvib_dir_code, first_wp->speed);
            
            // 이 페이로드를 보낼 그룹 ID들이 결정되었다고 가정 (예: {1, 3})
            // 실제로는 CVIBDirCode와 WayPoint 정보를 바탕으로 target_group_ids와 num_target_groups를 결정해야 함
            // VMS_MessageToSend_t new_msg1;
            // new_msg1.payload_str = strdup(temp_payload);
            // new_msg1.target_group_ids = malloc(sizeof(int)*2); new_msg1.target_group_ids[0]=1; new_msg1.target_group_ids[1]=3;
            // new_msg1.num_target_groups = 2;
            // new_msg1.command_type = CMD_TYPE_INSERT; 
            // // message_list에 new_msg1 추가 (realloc 및 count 증가)
            // (구현 필요) add_message_to_list(message_list, new_msg1);


            // 1.2.2. 두 번째 메시지 (HostObject 마지막 WP 기반)
            //      - 대상 그룹 결정 로직
            //      - 페이로드 생성 로직
            //      - message_list에 VMS_MessageToSend_t 추가
        }
    }

    // 2. ConflictPos 확인 및 관련 메시지 생성
    bool conflict_found = false;
    for (int i = 0; i < parsed_message->num_approach_traffic_info; ++i) {
        const SdsJson_ApproachTrafficInfoData_t* ati = &parsed_message->approach_traffic_info_list[i];
        if (ati->conflict_pos) {
            conflict_found = true;
            printf("  ConflictPos found in ATI item %d: lat=%.7f, lon=%.7f\n",
                   i, ati->conflict_pos->lat, ati->conflict_pos->lon);
            // ConflictPos 존재 시 HostObject, RemoteObject의 첫 WP 정보 확인
            // 경고 메시지 생성 및 대상 그룹 결정
            // message_list에 VMS_MessageToSend_t 추가
            break; // 우선 첫 번째 발견된 ConflictPos에 대해서만 처리 (예시)
        }
    }
    if(!conflict_found) {
        printf("  No ConflictPos found in any ApproachTrafficInfo item.\n");
    }

    // 임시: 현재는 메시지를 생성하지 않으므로 count가 0인 리스트 반환
    // 실제로는 위 로직에서 message_list->messages 와 message_list->count 가 채워져야 함
    if(message_list->count == 0 && message_list->messages == NULL) {
         printf("[VMSController] No messages determined to be sent.\n");
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
