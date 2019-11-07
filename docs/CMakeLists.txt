#==============================================================================
# Copyright (C) 2019 Gustavo Santos Salomão
# All rights reserved.
#
# This project cannot be copied and/or distributed without
# the express permission of the author.
#==============================================================================

find_package(Doxygen QUIET)

if(${Doxygen_FOUND})

  doxygen_add_docs(docs ${PROJECT_SOURCE_DIR}/includes
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
    COMMENT "Generate documentation")

else()
  message(WARNING "Doxygen not found! Documentation cannot be generated...")
endif()
