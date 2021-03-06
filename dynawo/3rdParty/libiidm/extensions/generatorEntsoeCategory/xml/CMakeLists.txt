# Copyright (c) 2016-2019, RTE (http://www.rte-france.com)
# All rights reserved.
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# SPDX-License-Identifier: MPL-2.0
#
# This file is part of Libiidm, a library to model IIDM networks and allows importing and exporting them to files.

project(libiidm_ext_generatorentsoecategory_xml CXX)

set(CPACK_COMPONENTS_ALL ${CPACK_COMPONENTS_ALL} "iidm-ext-generatorentsoecategory-xml" PARENT_SCOPE)

set(CPACK_COMPONENT_IIDM-EXT-GENERATORENTSOECATEGORY-XML_DISPLAY_NAME "GeneratorEntsoeCategory XML")
set(CPACK_COMPONENT_IIDM-EXT-GENERATORENTSOECATEGORY-XML_DESCRIPTION "XML support library for the GeneratorEntsoeCategory extension.")

set(CPACK_COMPONENT_IIDM-EXT-GENERATORENTSOECATEGORY-XML_GROUP iidm-extensions)
set(CPACK_COMPONENT_IIDM-EXT-GENERATORENTSOECATEGORY-XML_DEPENDS iidm-ext-generatorentsoecategory iidm-xml)

configure_file(
  ${CMAKE_CURRENT_SOURCE_DIR}/include/IIDM/extensions/generatorEntsoeCategory/xml/version.h.in
  ${CMAKE_CURRENT_SOURCE_DIR}/include/IIDM/extensions/generatorEntsoeCategory/xml/version.h
)

configure_file(
  ${CMAKE_CURRENT_SOURCE_DIR}/include/internals/config.h.in
  ${CMAKE_CURRENT_SOURCE_DIR}/include/internals/config.h
)


set(IIDM_EXT_GENERATORENTSOECATEGORY_XML_SOURCES
  src/GeneratorEntsoeCategoryHandler.cpp
  src/GeneratorEntsoeCategoryFormatter.cpp
)

add_library(iidm-ext-generatorentsoecategory-xml ${IIDM_EXT_GENERATORENTSOECATEGORY_XML_SOURCES})

target_include_directories(iidm-ext-generatorentsoecategory-xml
  PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

target_link_libraries(iidm-ext-generatorentsoecategory-xml
  iidm-ext-generatorentsoecategory
  iidm-xml
)

set_target_properties(iidm-ext-generatorentsoecategory-xml
  PROPERTIES
    VERSION ${IIDM_VERSION_STRING}
    SOVERSION ${IIDM_VERSION_MAJOR}
    WINDOWS_EXPORT_ALL_SYMBOLS TRUE
)

install(TARGETS iidm-ext-generatorentsoecategory-xml EXPORT iidm-ext-generatorentsoecategory-xml-config
  PUBLIC_HEADER DESTINATION ${LibIIDM_INSTALL_INCLUDE}
  ARCHIVE DESTINATION ${LibIIDM_INSTALL_LIBRARIES}
  LIBRARY DESTINATION ${LibIIDM_INSTALL_LIBRARIES}
  RUNTIME DESTINATION ${LibIIDM_INSTALL_BINARIES}
  RESOURCE DESTINATION ${IIDM_SHARE_PATH}
  OPTIONAL
  COMPONENT iidm-ext-generatorentsoecategory-xml
)

install(DIRECTORY include/IIDM
  DESTINATION ${LibIIDM_INSTALL_INCLUDE}
  OPTIONAL
  COMPONENT iidm-ext-generatorentsoecategory-xml
  FILES_MATCHING PATTERN "*.h"
)

#install(DIRECTORY ...) append the last part of input paths to the destination path. Adding a "/" prevents this.
install(DIRECTORY share/
  DESTINATION ${IIDM_SHARE_PATH}
  OPTIONAL
  COMPONENT iidm-ext-generatorentsoecategory-xml
)

install(EXPORT iidm-ext-generatorentsoecategory-xml-config
  DESTINATION ${LibIIDM_INSTALL_CMAKE}
  FILE libiidm-ext-generatorentsoecategory-xml-targets.cmake
  OPTIONAL
  COMPONENT iidm-ext-generatorentsoecategory-xml
)

include(CMakePackageConfigHelpers)
configure_package_config_file(libiidm-ext-generatorentsoecategory-xml-config.cmake.in
  ${CMAKE_CURRENT_BINARY_DIR}/libiidm-ext-generatorentsoecategory-xml-config.cmake
  INSTALL_DESTINATION ${LibIIDM_INSTALL_CMAKE}
  PATH_VARS
    LibIIDM_INSTALL_INCLUDE
    LibIIDM_INSTALL_LIBRARIES
    LibIIDM_INSTALL_BINARIES
  NO_CHECK_REQUIRED_COMPONENTS_MACRO
)

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/libiidm-ext-generatorentsoecategory-xml-config.cmake
  DESTINATION ${LibIIDM_INSTALL_CMAKE}
  OPTIONAL
  COMPONENT iidm-ext-generatorentsoecategory-xml
)

# create a target to install this extension (and dependencies).
add_custom_target(install-generatorentsoecategory-xml
  DEPENDS iidm-ext-generatorentsoecategory-xml
  COMMAND
    "${CMAKE_COMMAND}" -DCMAKE_INSTALL_COMPONENT=iidm-ext-generatorentsoecategory-xml
    -P "${CMAKE_BINARY_DIR}/cmake_install.cmake"
)

# Make extensions and install-extensions target depends on this extension
add_dependencies(extensions-xml iidm-ext-generatorentsoecategory-xml)
add_dependencies(install-extensions-xml install-generatorentsoecategory-xml)


if(BUILD_SAMPLES)
  add_library(iidm-ext-generatorentsoecategory-xml-testing EXCLUDE_FROM_ALL ${IIDM_EXT_GENERATORENTSOECATEGORY_XML_SOURCES})

  target_compile_definitions(iidm-ext-generatorentsoecategory-xml-testing PRIVATE IIDM_TESTING)

  target_include_directories(iidm-ext-generatorentsoecategory-xml-testing
    PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  )

  target_link_libraries(iidm-ext-generatorentsoecategory-xml-testing
    iidm-ext-generatorentsoecategory
    iidm-xml-testing
  )

  set_target_properties(iidm-ext-generatorentsoecategory-xml-testing
    PROPERTIES
      VERSION ${IIDM_VERSION_STRING}
      SOVERSION ${IIDM_VERSION_MAJOR}
      WINDOWS_EXPORT_ALL_SYMBOLS TRUE
  )

  add_custom_command(TARGET iidm-ext-generatorentsoecategory-xml-testing PRE_BUILD
    COMMAND ${CMAKE_COMMAND} -E
      copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/share/xsd ${CMAKE_BINARY_DIR}/${IIDM_SHARE_PATH}/xsd
    COMMENT "copying xsd to test directory"
    VERBATIM
  )
endif()
