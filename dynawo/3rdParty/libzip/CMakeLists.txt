# Copyright (c) 2013-2019, RTE (http://www.rte-france.com)
# All rights reserved.
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# SPDX-License-Identifier: MPL-2.0
#
# This file is part of Libzip, a library to handle zip archives.

cmake_minimum_required(VERSION 2.6 FATAL_ERROR)

if(${CMAKE_VERSION} VERSION_GREATER "3.15.0")
  if(POLICY CMP0091)
    cmake_policy(SET CMP0091 NEW)
  endif()
endif()

project(zip)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

set(LIBZIP_BUILD_SHARED TRUE CACHE BOOL "Build LibZIP as shared library.")
set(LIBZIP_BUILD_STATIC TRUE CACHE BOOL "Build LibZIP as static library.")
set(LIBZIP_BUILD_TESTS TRUE CACHE BOOL "Build LibZIP tests.")
set(LIBZIP_BUILD_SAMPLES TRUE CACHE BOOL "Build LibZIP samples.")

set(MSVC_STATIC_RUNTIME_LIBRARY OFF CACHE BOOL "Choose either ON or OFF.")

set(CMAKE_POSITION_INDEPENDENT_CODE ON)

find_package(Boost 1.39 REQUIRED)
if (LIBZIP_BUILD_TESTS)
    find_package(GTest)
endif ()

if (NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "RelWithDebInfo" CACHE STRING "Choose the type of build: Debug Release RelWithDebInfo MinSizeRel" FORCE)
endif ()

if(MSVC)
  if(LIBZIP_BUILD_STATIC)
    if(MSVC_STATIC_RUNTIME_LIBRARY)
      set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
    endif()
  endif()
endif()

if(NOT MSVC)
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -O0")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror")
set(CXX11_ENABLED ${CXX11_ENABLED} CACHE BOOL "")
if (CXX11_ENABLED)
  # Test if a C++11 flag is supported
  include(CheckCXXCompilerFlag)
  check_cxx_compiler_flag("-std=c++11" COMPILER_SUPPORTS_CXX11)
  check_cxx_compiler_flag("-std=c++0x" COMPILER_SUPPORTS_CXX0X)
  if (COMPILER_SUPPORTS_CXX11)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
    add_definitions(-DLANG_CXX11)
  elseif (COMPILER_SUPPORTS_CXX0X)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
    add_definitions(-DLANG_CXX0X)
  else ()
    message(STATUS "The compiler ${CMAKE_CXX_COMPILER} has no C++11 support. Disabling C++11.")
  endif ()
else ()
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++98")
endif ()
endif()

set(BIN_INSTALL_DIR "bin" CACHE PATH "The directory the executables are installed in.")
set(INCLUDE_INSTALL_DIR "include" CACHE PATH "The directory the headers are installed in.")
set(LIB_INSTALL_DIR "lib" CACHE STRING "The directory the libraries are installed in.")

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)
include_directories(${Boost_INCLUDE_DIRS})
if (LIBZIP_BUILD_TESTS)
  include_directories(${GTEST_INCLUDE_DIRS})
endif ()

add_subdirectory(src)
if (LIBZIP_BUILD_SAMPLES)
  add_subdirectory(samples)
endif ()
if (LIBZIP_BUILD_TESTS)
  add_subdirectory(test)
endif ()
