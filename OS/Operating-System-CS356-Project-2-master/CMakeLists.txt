cmake_minimum_required(VERSION 3.15)
project(Operating_System_CS356_Project_2_master C)

set(CMAKE_C_STANDARD 11)

include_directories(.)

add_executable(Operating_System_CS356_Project_2_master
        console.c
        console.h
        control.c
        control.h
        cpu.c
        cpu.h
        error_codes.h
        memory.c
        memory.h
        pager.c
        pager.h
        scheduler.c
        scheduler.h
        types.h)
