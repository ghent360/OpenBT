/*
 ============================================================================
 Name        : timelogger.c
 Author      : Venelin Efremov
 Version     :
 Copyright   : Copyright (c) 2016
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stropts.h>
#include <asm/termios.h>
#include <time.h>
#include <string.h>
#include <unistd.h>

static uint32_t _start_time;

static uint32_t timeGetTime() {
    struct timespec time;

    if (clock_gettime(CLOCK_MONOTONIC_COARSE, &time) < 0) {
        if (clock_gettime(CLOCK_BOOTTIME, &time) < 0) {
            clock_gettime(CLOCK_REALTIME, &time);
        }
    }
    return time.tv_sec * 1000 + time.tv_nsec / 1000000;
}

static void format_time(int fd) {
    static char time_buffer[20];//"HH:MM:SS.mmmm: ";

    uint32_t current_time = timeGetTime() - _start_time;
    snprintf(time_buffer, 19, "%02d:%02d:%02d.%04d: ",
            (current_time / 3600000) % 24,
            (current_time / 60000) % 60,
            (current_time / 1000) % 60,
            current_time % 1000);
    write(fd, time_buffer, strlen(time_buffer));
}

static int process_data(int fd_input, int fd_output) {
    static char buffer[16384];
    static char out_line[4046];
    int buffer_len;
    int line_len;
    int idx;

    line_len = 0;
    while (1) {
        buffer_len = read(fd_input, buffer, sizeof(buffer));
        if (buffer_len <= 0) break;
        for (idx = 0; idx < buffer_len; idx++) {
            if (buffer[idx] == '\r') continue;
            if (line_len == 0) {
                format_time(fd_output);
            }
            out_line[line_len++] = buffer[idx];
            if (buffer[idx] == '\n' || line_len >= sizeof(out_line)) {
                write(fd_output, out_line, line_len);
                line_len = 0;
            }
        }
    }
    close(fd_output);
    if (fd_input)
        close(fd_input);
    return EXIT_SUCCESS;
}

static void print_usage() {
    printf("timelogger: baud_rate serial_port_device output_file\n");
}

int main(int argc, char *argv[]) {
    int baud_rate;
    int fd_input;
    int fd_output;
    struct termios2 tio;

    if (argc != 4) {
        print_usage();
        return EXIT_FAILURE;
    }
    baud_rate = atoi(argv[1]);
    printf("Baud rate %d\n", baud_rate);
    _start_time = timeGetTime();
    while (1) {
        if (argv[2][0] == '-' && argv[2][1] == 0) {
            fd_input = 0;
        } else {
            fd_input = open(argv[2], O_RDONLY);
        }
        if (fd_input < 0) {
            printf("Unable to open input file %s\n", argv[2]);
            return EXIT_FAILURE;
        }
        if (ioctl(fd_input, TCGETS2, &tio)) {
            printf("Unable to execute ioctl(TCGETS2)\n");
        } else {
            tio.c_cflag &= ~CBAUD;
            tio.c_cflag |= BOTHER;
            tio.c_ispeed = baud_rate;
            tio.c_ospeed = baud_rate;
            if (ioctl(fd_input, TCSETS2, &tio)) {
                printf("Unable to execute ioctl(TCSETS2)\n");
            }
        }
        fd_output = open(argv[3], O_APPEND | O_CREAT | O_WRONLY, 0666);
        if (fd_input < 0) {
            printf("Unable to open input file %s\n", argv[2]);
            return EXIT_FAILURE;
        }
        write(fd_output, "\n----------\n", 12);

        process_data(fd_input, fd_output);
    }
}
