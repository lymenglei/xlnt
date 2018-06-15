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

file(GLOB SAMPLE_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)


# build executable program name Demo,
add_executable(menglei test.cpp)

target_link_libraries(menglei PRIVATE xlnt)