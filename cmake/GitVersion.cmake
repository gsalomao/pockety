#==============================================================================
# Copyright (C) 2019 Gustavo Santos Salomão
# All rights reserved.
#
# This project cannot be copied and/or distributed without 
# the express permission of the author.
#==============================================================================

###############################################################################
# Define project version using semantic versioning based on Git tag.
#
# This configuration file defines the project version using semantic versioning
# based on Git tag used. If the current commit does not have a tag, the project
# version will be the invalid version number (0.0.0).
#
# This configuration file sets the following variables:
#    - PROJECT__VERSION_MAJOR: Major number
#    - PROJECT__VERSION_MINOR: Minir number
#    - PROJECT__VERSION_PATCH: Patch number
#    - PROJECT__VERSION: Project version (<Major.Minor.Patch>)
###############################################################################

# Define invalid project version
set(PRJ_VERSION_MAJOR 0)
set(PRJ_VERSION_MINOR 0)
set(PRJ_VERSION_PATCH 0)

# Get Git revision
find_package(Git REQUIRED QUIET)
execute_process(
  COMMAND ${GIT_EXECUTABLE} describe --tags
  WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
  OUTPUT_VARIABLE GIT_TAG
  ERROR_VARIABLE GIT_TAG_NOT_FOUND
  OUTPUT_STRIP_TRAILING_WHITESPACE
  ERROR_STRIP_TRAILING_WHITESPACE
)

# Extract the project version from Git tag
if(NOT GIT_TAG_NOT_FOUND)
  string(REGEX REPLACE "^([vV]*)([0-9]*)([.][0-9]*[.][0-9]*-?.*)$" "\\2"
    TAG_NUMBER ${GIT_TAG})
  set(PRJ_VERSION_MAJOR ${TAG_NUMBER})

  string(REGEX REPLACE "^([vV]*)([0-9]*[.])([0-9]*)([.][0-9]*-?.*)$" "\\3"
    TAG_NUMBER ${GIT_TAG})
  set(PRJ_VERSION_MINOR ${TAG_NUMBER})

  string(REGEX REPLACE "^([vV]*)([0-9]*[.][0-9]*[.])([0-9]*)(-?.*)$" "\\3"
    TAG_NUMBER ${GIT_TAG})
  set(PRJ_VERSION_PATCH ${TAG_NUMBER})
endif()

# Define semantic project version
set(PROJECT_VERSION_MAJOR PRJ_VERSION_MAJOR)
set(PROJECT_VERSION_MINOR PRJ_VERSION_MINOR)
set(PROJECT_VERSION_PATCH PRJ_VERSION_PATCH)
set(PROJECT_VERSION
  "${PRJ_VERSION_MAJOR}.${PRJ_VERSION_MINOR}.${PRJ_VERSION_PATCH}")
