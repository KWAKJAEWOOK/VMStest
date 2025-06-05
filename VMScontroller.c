// VMScontroller.c

#include "VMScontroller.h"
#include "VMSprotocol.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define CONFIG_LINE_MAX_LEN 256 // INI 파일 한 줄 최대 길이

// config.ini 파싱 시 키-값 쌍을 처리하는 내부 헬퍼 함수
static void parse_config_line(const char* key, const char* value, VMS_TextParamConfig_t* config) {
    if (strcmp(key, "RST") == 0) strncpy(config->rst, value, sizeof(config->rst) - 1);
    else if (strcmp(key, "SPD") == 0) strncpy(config->spd, value, sizeof(config->spd) - 1);
    else if (strcmp(key, "NEN") == 0) strncpy(config->nen, value, sizeof(config->nen) - 1);
    else if (strcmp(key, "LNE") == 0) strncpy(config->lne, value, sizeof(config->lne) - 1);
    else if (strcmp(key, "YSZ") == 0) strncpy(config->ysz, value, sizeof(config->ysz) - 1);
    else if (strcmp(key, "EFF") == 0) strncpy(config->eff, value, sizeof(config->eff) - 1);
    else if (strcmp(key, "DLY") == 0) strncpy(config->dly, value, sizeof(config->dly) - 1);
    else if (strcmp(key, "FIX") == 0) strncpy(config->fix, value, sizeof(config->fix) - 1);
    else if (strcmp(key, "DEFALT_FONT") == 0) strncpy(config->default_font, value, sizeof(config->default_font) - 1);
    else if (strcmp(key, "DEFAULT_COLOR") == 0) strncpy(config->default_color, value, sizeof(config->default_color) - 1);
    // strncpy 후에는 항상 널 종료 보장
    config->rst[sizeof(config->rst)-1] = '\0';
    config->spd[sizeof(config->spd)-1] = '\0';
    config->nen[sizeof(config->nen)-1] = '\0';
    config->ysz[sizeof(config->ysz)-1] = '\0';
    config->eff[sizeof(config->eff)-1] = '\0';
    config->dly[sizeof(config->dly)-1] = '\0';
    config->fix[sizeof(config->fix)-1] = '\0';
    config->default_font[sizeof(config->default_font)-1] = '\0';
    config->default_color[sizeof(config->default_color)-1] = '\0';
}

// 외부에서 호출할 config 로드 함수
bool vms_controller_load_config(const char* config_filepath, VMS_TextParamConfig_t* out_config) {
    if (!config_filepath || !out_config) return false;

    FILE* file = fopen(config_filepath, "r");
    if (!file) {
        perror("VMScontroller: Failed to open config.ini");
        fprintf(stderr, "Config file path attempted: %s\n", config_filepath);
        return false;
    }

    memset(out_config, 0, sizeof(VMS_TextParamConfig_t)); // 구조체 초기화

    char line[CONFIG_LINE_MAX_LEN];
    bool in_text_protocol_section = false;

    while (fgets(line, sizeof(line), file)) {
        char* trimmed_line = line;
        char *start = line;
        while (isspace((unsigned char)*start)) start++;
        char *end = line + strlen(line) - 1;
        while (end > start && isspace((unsigned char)*end)) end--;
        *(end + 1) = '\0';
        trimmed_line = start;

        if (trimmed_line[0] == '#' || trimmed_line[0] == ';' || trimmed_line[0] == '\0') {
            continue; // 주석 또는 빈 줄 건너뛰기
        }

        if (strcmp(trimmed_line, "[텍스트 프로토콜 파라미터]") == 0) {
            in_text_protocol_section = true;
            continue;
        } else if (trimmed_line[0] == '[') { // 다른 섹션 시작
            in_text_protocol_section = false;
            continue;
        }

        if (in_text_protocol_section) {
            char* key = trimmed_line;
            char* separator = strchr(trimmed_line, '=');
            if (separator) {
                *separator = '\0'; // 키와 값 분리
                char* value = separator + 1;
                
                // 간단한 trim 추가
                char* trimmed_key = key; // 실제로는 trim_whitespace(key) 사용 권장
                while(isspace((unsigned char)*trimmed_key)) trimmed_key++;
                char* key_end = trimmed_key + strlen(trimmed_key) - 1;
                while(key_end > trimmed_key && isspace((unsigned char)*key_end)) key_end--;
                *(key_end+1) = '\0';

                char* trimmed_value = value; // 실제로는 trim_whitespace(value) 사용 권장
                while(isspace((unsigned char)*trimmed_value)) trimmed_value++;
                char* value_end = trimmed_value + strlen(trimmed_value) - 1;
                while(value_end > trimmed_value && isspace((unsigned char)*value_end)) value_end--;
                *(value_end+1) = '\0';

                parse_config_line(trimmed_key, trimmed_value, out_config);
            }
        }
    }
    fclose(file);
    // 디버깅용 값 확인
    // printf("Config loaded: RST=%s, SPD=%s, FONT=%s, COLOR=%s\n",
    //        out_config->rst, out_config->spd, out_config->default_font, out_config->default_color);
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
