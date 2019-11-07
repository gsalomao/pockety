#==============================================================================
# Copyright (C) 2019 Gustavo Santos Salomão
# All rights reserved.
#
# This project cannot be copied and/or distributed without
# the express permission of the author.
#==============================================================================

cmake_minimum_required(VERSION 3.15 FATAL_ERROR)
project(pockety LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED YES)
set(CMAKE_CXX_EXTENSIONS OFF)

# Prevent in-source build
if(${PROJECT_SOURCE_DIR} STREQUAL ${PROJECT_BINARY_DIR})
  message(FATAL_ERROR "In-source builds not allowed. "
    "Please make a new directory (called build directory) and run CMake from "
    "there.")
endif()

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type" FORCE)
endif()

message(STATUS "Project will be installed into ${CMAKE_INSTALL_PREFIX}")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra")
list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)

include(GitVersion)
message(STATUS "Project version: ${PROJECT_VERSION}")

include_directories(src)
set(MODULES "")

# Add modules to build system
# TODO: Add application modules

# Remove leading or trailing whitespace
# TODO: string(STRIP ${MODULES} MODULES)

add_subdirectory(docs)
add_subdirectory(src/app)

enable_testing()
add_subdirectory(test)
