#==============================================================================
# Copyright (C) 2019 Gustavo Santos Salomão 
# All rights reserved.
#
# This project cannot be copied and/or distributed without 
# the express permission of the author.
#==============================================================================

add_executable(${PROJECT_NAME})
target_link_libraries(${PROJECT_NAME}
  PRIVATE ${MODULES})

target_sources(${PROJECT_NAME}
  PRIVATE main.cpp)
