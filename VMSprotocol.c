// VMSprotocol.c

#include "VMSprotocol.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Little-endian으로 uint16_t 값을 버퍼에 쓰는 헬퍼 함수
static void pack_uint16_le(uint8_t* buf, uint16_t val) {
    buf[0] = (uint8_t)(val & 0xFF);
    buf[1] = (uint8_t)((val >> 8) & 0xFF);
}

// Little-endian으로 int16_t 값을 버퍼에 쓰는 헬퍼 함수
static void pack_int16_le(uint8_t* buf, int16_t val) {
    pack_uint16_le(buf, (uint16_t)val);
}

// Little-endian으로 uint32_t 값을 버퍼에 쓰는 헬퍼 함수
static void pack_uint32_le(uint8_t* buf, uint32_t val) {
    buf[0] = (uint8_t)(val & 0xFF);
    buf[1] = (uint8_t)((val >> 8) & 0xFF);
    buf[2] = (uint8_t)((val >> 16) & 0xFF);
    buf[3] = (uint8_t)((val >> 24) & 0xFF);
}

// M30 전광판 제어 프로토콜용 체크섬 계산 [cite: 14]
// (STX + Type + Length(2B) + Data(n bytes))
static uint8_t calculate_text_control_checksum(const uint8_t* buffer_stx_to_data, uint16_t length_stx_to_data) {
    uint8_t checksum = 0;
    for (uint16_t i = 0; i < length_stx_to_data; ++i) {
        checksum += buffer_stx_to_data[i];
    }
    return checksum;
}

// 이미지 전송 프로토콜용 체크섬 계산 [cite: 2]
// (Command + Length 필드 + Data 필드)
// buffer_cmd_to_data: Command 바이트부터 시작하는 포인터
// length_cmd_to_data: Command, Length 필드, Data 필드의 총 길이
static uint8_t calculate_image_checksum(const uint8_t* buffer_cmd_to_data, uint32_t length_cmd_to_data) {
    uint8_t checksum = 0;
    for (uint32_t i = 0; i < length_cmd_to_data; ++i) {
        checksum += buffer_cmd_to_data[i];
    }
    return checksum;
}


uint8_t* create_text_control_packet(uint8_t command_type, const char* data_str, uint16_t* out_packet_len) {
    size_t data_str_len = strlen(data_str);
    uint16_t actual_data_field_len = data_str_len * 2;
    uint8_t* data_field_bytes = (uint8_t*)malloc(actual_data_field_len);
    if (!data_field_bytes) {
        perror("Failed to allocate memory for data_field_bytes");
        return NULL;
    }
    for (size_t i = 0; i < data_str_len; ++i) {
        data_field_bytes[i * 2] = (uint8_t)data_str[i]; // 하위 바이트
        data_field_bytes[i * 2 + 1] = 0x00;            // 상위 바이트
    }

    // 2. 전체 패킷 길이 계산: STX(1) + TYPE(1) + LENGTH(2) + DATA(actual_data_field_len) + CHECKSUM(1) + ETX(1)
    uint16_t total_packet_len = 1 + 1 + 2 + actual_data_field_len + 1 + 1;
    uint8_t* packet = (uint8_t*)malloc(total_packet_len);
    if (!packet) {
        perror("Failed to allocate memory for packet");
        free(data_field_bytes);
        return NULL;
    }

    // 3. 패킷 필드 채우기
    uint16_t current_idx = 0;
    packet[current_idx++] = TEXT_CONTROL_STX;         // STX
    packet[current_idx++] = command_type;             // TYPE
    pack_uint16_le(&packet[current_idx], actual_data_field_len); // LENGTH (Data 길이) [cite: 13, 15]
    current_idx += 2;
    memcpy(&packet[current_idx], data_field_bytes, actual_data_field_len); // DATA
    current_idx += actual_data_field_len;

    // 4. 체크섬 계산 (STX부터 DATA까지)
    uint16_t len_for_checksum = 1 + 1 + 2 + actual_data_field_len;
    packet[current_idx++] = calculate_text_control_checksum(packet, len_for_checksum); // CHECKSUM

    packet[current_idx++] = TEXT_CONTROL_ETX;         // ETX

    free(data_field_bytes);
    *out_packet_len = total_packet_len;
    return packet;
}

uint8_t* create_image_packet(uint8_t image_type, uint8_t image_command,
                             int16_t sx, int16_t sy, int16_t width, int16_t height,
                             const char* image_filepath, uint32_t* out_packet_len) {
    if (image_command != CMD_IMG_DATA_TX) {
        fprintf(stderr, "Unsupported image command: 0x%02X\n", image_command);
        return NULL;
    }

    // 1. 이미지 파일 읽기
    FILE* img_file = fopen(image_filepath, "rb");
    if (!img_file) {
        perror("Failed to open image file");
        fprintf(stderr, "Image path: %s\n", image_filepath);
        return NULL;
    }
    fseek(img_file, 0, SEEK_END);
    long image_file_data_len = ftell(img_file);
    fseek(img_file, 0, SEEK_SET);
    if (image_file_data_len <= 0) {
        fprintf(stderr, "Image file is empty or error getting size.\n");
        fclose(img_file);
        return NULL;
    }
    uint8_t* image_file_data = (uint8_t*)malloc(image_file_data_len);
    if (!image_file_data) {
        perror("Failed to allocate memory for image file data");
        fclose(img_file);
        return NULL;
    }
    if (fread(image_file_data, 1, image_file_data_len, img_file) != (size_t)image_file_data_len) {
        perror("Failed to read image file data");
        fclose(img_file);
        free(image_file_data);
        return NULL;
    }
    fclose(img_file);

    // 2. 프로토콜의 Data 부분 길이 계산: IMAGE_HEADER 크기 + 이미지 파일 데이터 크기
    uint32_t protocol_data_len = sizeof(IMAGE_HEADER) + image_file_data_len;

    // 3. 전체 패킷 길이 계산: Start(1) + Cmd(1) + Length(4) + Data(protocol_data_len) + Checksum(1)
    uint32_t total_packet_len = 1 + 1 + 4 + protocol_data_len + 1;
    uint8_t* packet = (uint8_t*)malloc(total_packet_len);
    if (!packet) {
        perror("Failed to allocate memory for image packet");
        free(image_file_data);
        return NULL;
    }

    // 4. 패킷 필드 채우기
    uint32_t current_idx = 0;
    packet[current_idx++] = IMAGE_START_BYTE;         // Start (0xAA)
    packet[current_idx++] = image_command;            // Command (e.g., 0xB1)

    pack_uint32_le(&packet[current_idx], protocol_data_len); // Length 필드 (Little-Endian) [cite: 1]
    current_idx += 4;

    // IMAGE_HEADER 채우기 및 복사 (Little-Endian) [cite: 1]
    IMAGE_HEADER header;
    header.type = image_type;
    memset(header.rsv, 0, sizeof(header.rsv)); // rsv 필드 0으로 초기화
    header.sx = sx;
    header.sy = sy;
    header.width = width;
    header.height = height;

    packet[current_idx++] = header.type;
    memcpy(&packet[current_idx], header.rsv, 3); current_idx += 3;
    pack_int16_le(&packet[current_idx], header.sx); current_idx += 2;
    pack_int16_le(&packet[current_idx], header.sy); current_idx += 2;
    pack_int16_le(&packet[current_idx], header.width); current_idx += 2;
    pack_int16_le(&packet[current_idx], header.height); current_idx += 2;

    // 이미지 파일 데이터 복사
    memcpy(&packet[current_idx], image_file_data, image_file_data_len);
    current_idx += image_file_data_len;

    // 5. 체크섬 계산 (Command + Length 필드 + Data 필드)
    // 체크섬 계산 시작점은 Command 바이트 (packet[1])
    // 체크섬 계산할 총 길이는 Command(1) + Length필드(4) + protocol_data_len
    uint32_t len_for_checksum = 1 + 4 + protocol_data_len;
    packet[current_idx++] = calculate_image_checksum(&packet[1], len_for_checksum); // Checksum

    free(image_file_data);
    *out_packet_len = total_packet_len;
    return packet;
}

uint8_t* create_image_buffer_init_packet(uint32_t* out_packet_len) {
    // Data 없음. Command: 0xB0 [cite: 4]
    uint32_t protocol_data_len = 0; // Data 없음

    // 전체 패킷 길이: Start(1) + Cmd(1) + Length(4) + Data(0) + Checksum(1)
    uint32_t total_packet_len = 1 + 1 + 4 + protocol_data_len + 1;
    uint8_t* packet = (uint8_t*)malloc(total_packet_len);
    if (!packet) {
        perror("Failed to allocate memory for image buffer init packet");
        return NULL;
    }

    uint32_t current_idx = 0;
    packet[current_idx++] = IMAGE_START_BYTE;     // Start (0xAA)
    packet[current_idx++] = CMD_IMG_BUF_INIT;     // Command (0xB0)
    pack_uint32_le(&packet[current_idx], protocol_data_len); // Length (0) [cite: 1]
    current_idx += 4;
    // Data 없음

    // 체크섬 계산 (Command + Length 필드 + Data 필드(0바이트))
    uint32_t len_for_checksum = 1 + 4 + protocol_data_len;
    packet[current_idx++] = calculate_image_checksum(&packet[1], len_for_checksum); // Checksum

    *out_packet_len = total_packet_len;
    return packet;
}
