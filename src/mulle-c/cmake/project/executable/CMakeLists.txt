cmake_minimum_required( VERSION 3.0)

project( <|PROJECT_NAME|> <|PROJECT_UPCASE_LANGUAGE|>)


### mulle-sde environment

# add cmake module paths to search path
list( INSERT CMAKE_MODULE_PATH 0 "${PROJECT_SOURCE_DIR}/cmake/share")
list( INSERT CMAKE_MODULE_PATH 0 "${PROJECT_SOURCE_DIR}/cmake")

include( Environment)


### Files

include( PreFiles OPTIONAL)

#
# Include all .cmake files in ./cmake
#
file( GLOB LOCAL_CMAKE_INCLUDES
   "cmake/[A-Za-z0-9]*.cmake"
)

foreach( FILE ${LOCAL_CMAKE_INCLUDES} )
   include( "${FILE}")
endforeach()


include( PostFiles OPTIONAL)


### Executable

include( PreExecutable OPTIONAL)

add_executable( <|PROJECT_NAME|>
   ${SOURCES}
   ${PUBLIC_HEADERS}
   ${PRIVATE_HEADERS}
   ${CMAKE_EDITABLE_FILES}
)


set( INSTALL_EXECUTABLE_TARGETS
   ${INSTALL_EXECUTABLE_TARGETS}
   "<|PROJECT_NAME|>"
)


target_link_libraries( <|PROJECT_NAME|>
   ${ALL_LOAD_DEPENDENCY_LIBRARIES}
   ${DEPENDENCY_LIBRARIES}
   ${OPTIONAL_DEPENDENCY_LIBRARIES}
   ${OS_SPECIFIC_LIBRARIES}
)

include( PostExecutable OPTIONAL)

### Install

include( PreInstall OPTIONAL)

install( TARGETS ${INSTALL_EXECUTABLE_TARGETS} DESTINATION "bin")

include( PostInstall OPTIONAL)

# only for Executable

include( Motd OPTIONAL)

