#==============================================================================
# Copyright (C) 2019 Gustavo Santos Salomão 
# All rights reserved.
#
# This project cannot be copied and/or distributed without 
# the express permission of the author.
#==============================================================================

find_package(GTest QUIET)

if(${GTest_FOUND})
  set(TEST_REPORT_PATH "${CMAKE_BINARY_DIR}/test-report" CACHE STRING
    "Folder to store the test reports")

  message(STATUS "Test report path: ${TEST_REPORT_PATH}")

  add_custom_target(build_tests)

  if(ENABLE_COVERAGE)
    find_program(LCOV lcov REQUIRED)

    add_custom_target(coverage)
    add_custom_command(TARGET coverage
      COMMAND ${LCOV} --directory ${CMAKE_SOURCE_DIR} --capture --output-file coverage.info
      COMMAND ${LCOV} --remove coverage.info '*/test/*' '/usr/*' --output-file coverage.info
      WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/test-report)
  endif()

  add_subdirectory(unit)
  add_subdirectory(integration)

else()
  message(WARNING "GTest not found! Unit and integration tests disabled...")
endif()
