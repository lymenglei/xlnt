cmake_minimum_required(VERSION 3.1)
project(xlnt.menglei)

if(NOT COMBINED_PROJECT)
  # Include xlnt library
  add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../source ${CMAKE_CURRENT_BINARY_DIR}/source)
endif()


if(STATIC_CRT)
  include(${CMAKE_CURRENT_SOURCE_DIR}/../cmake/ucm.cmake)
  ucm_set_runtime(STATIC)
endif()



# set debug enable(if you want to debug,set this true,you don't need to build a new build_dir) Release
set (CMAKE_BUILD_TYPE Debug)  
SET(CMAKE_CXX_FLAGS_DEBUG "$ENV{CXXFLAGS} -O0 -Wall -g -ggdb")
SET(CMAKE_CXX_FLAGS_RELEASE "$ENV{CXXFLAGS} -O3 -Wall")

set(MENGLEI_SOURCES test.cpp)
set(MENGLEI_EXECUTABLE menglei)
# build executable program name Demo,
add_executable(${MENGLEI_EXECUTABLE} ${MENGLEI_SOURCES})

target_link_libraries(${MENGLEI_EXECUTABLE} PRIVATE xlnt)


set(MENGLEI_EXECUTABLE ${MENGLEI_EXECUTABLE})

if(MSVC AND NOT STATIC)
  # Copy xlnt DLL into samples directory
  add_custom_command(TARGET ${MENGLEI_EXECUTABLE} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
    $<TARGET_FILE:xlnt>
    $<TARGET_FILE_DIR:${MENGLEI_EXECUTABLE}>)
endif()
