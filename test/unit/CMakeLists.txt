#==============================================================================
# Copyright (C) 2019 Gustavo Santos Salomão
# All rights reserved.
#
# This project cannot be copied and/or distributed without
# the express permission of the author.
#============================================================================

set(UNIT_TESTS ${PROJECT_NAME}_unit)
add_executable(${UNIT_TESTS} EXCLUDE_FROM_ALL)

set(UNIT_TEST_REPORT_FILE "unit-test-report.xml" CACHE STRING
  "File name of the unit test report")

message(STATUS "Unit test report file: ${UNIT_TEST_REPORT_FILE}")

add_dependencies(${UNIT_TESTS} ${PROJECT_NAME})
add_dependencies(build_tests ${UNIT_TESTS})
target_link_libraries(${UNIT_TESTS} GTest::Main ${MODULES})

add_test(NAME unit-tests
  COMMAND $<TARGET_FILE:${UNIT_TESTS}>
  --gtest_output=xml:${TEST_REPORT_PATH}/${UNIT_TEST_REPORT_FILE})

set_tests_properties(unit-tests
  PROPERTIES TIMEOUT 10)

# Include component's test
add_subdirectory(dummy)
