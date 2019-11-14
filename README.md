# Pockety 
[![Build Status](https://travis-ci.org/gsalomao/pockety.svg?branch=develop)](https://travis-ci.org/gsalomao/pockety)
[![Coverage Status](https://coveralls.io/repos/github/gsalomao/pockety/badge.svg?branch=develop)](https://coveralls.io/github/gsalomao/pockety?branch=develop)

Personal finance manager.

## Development
### Prerequisites
* CMake (version 3.15 or later)

### Install dependencies
Run the following command to install all dependencies:
```bash
$ apt-get install googletest
```

### Build
From the project folder, run the following command to build the application:
```bash
$ cmake -B build
```

### Test
The project is built with two categories of tests:
* Unit tests
* Integration tests

To build the tests, call the following command from the project folder:
```bash
$ cmake --build build/  --target build_tests
```

After those tests have been built, they can be executed calling the CTest or 
using the 'test' target.

To run the tests using the CTest, call the following command from the build 
folder:
```bash
$ ctest 
```

To run the tests using the 'test' target, call the following command from the 
project folder:
```bash
$ cmake --build build/  --target test
```

After the tests have been run, the following report files are created in the 
test report folder (build/test-reports):
* unit-test-report.xml
* integration-test-report.xml

To change the report folder and/or report files names, configure the project
with the following command:
```bash
$ cmake -B build \
    -DTEST_REPORT_FOLDER=<PATH> \
    -DUNIT_TEST_REPORT_FILE=<FILE NAME> \
    -DINTEGRATION_TEST_REPORT_FILE=<FILE NAME>
```
