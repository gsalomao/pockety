#==============================================================================
# Copyright (C) 2019 Gustavo Santos Salomão
# All rights reserved.
#
# This project cannot be copied and/or distributed without
# the express permission of the author.
#============================================================================

set(INTEGRATION_TESTS ${PROJECT_NAME}_integration)
add_executable(${INTEGRATION_TESTS} EXCLUDE_FROM_ALL)

set(INTEGRATION_TEST_REPORT_FILE "integration-test-report.xml" CACHE STRING
  "File name of the integration test report")

message(STATUS "Unit test report file: ${INTEGRATION_TEST_REPORT_FILE}")

add_dependencies(${INTEGRATION_TESTS} ${PROJECT_NAME})
add_dependencies(build_tests ${INTEGRATION_TESTS})
target_link_libraries(${INTEGRATION_TESTS} GTest::Main ${MODULES})

add_test(NAME integration-tests
  COMMAND $<TARGET_FILE:${INTEGRATION_TESTS}>
  --gtest_output=xml:${TEST_REPORT_PATH}/${INTEGRATION_TEST_REPORT_FILE})

set_tests_properties(integration-tests
  PROPERTIES TIMEOUT 600)

# Include component's test
add_subdirectory(dummy)
