cmake_minimum_required( VERSION 3.0)

project( <|PROJECT_NAME|> <|PROJECT_LANGUAGE|>)


### Files

if( NOT MULLE_CMAKE_INCLUDE_DIR)
   set( MULLE_CMAKE_INCLUDE_DIR "${PROJECT_SOURCE_DIR}/.mulle-sde/share/cmake")
endif()

if( EXISTS "${MULLE_CMAKE_INCLUDE_DIR}/<|PROJECT_LANGUAGE|>/PreFiles")
   include( "${MULLE_CMAKE_INCLUDE_DIR}/<|PROJECT_LANGUAGE|>/PreFiles")
endif()


include( CMakeHeadersAndSources.txt)
include( CMakeDependenciesAndLibraries.txt)


if( EXISTS "${MULLE_CMAKE_INCLUDE_DIR}/<|PROJECT_LANGUAGE|>/PostFiles")
   include( "${MULLE_CMAKE_INCLUDE_DIR}/<|PROJECT_LANGUAGE|>}/PostFiles")
endif()

### Executable

if( EXISTS "${MULLE_CMAKE_INCLUDE_DIR}/<|PROJECT_LANGUAGE|>}/PreExecutable")
   include( "${MULLE_CMAKE_INCLUDE_DIR}/<|PROJECT_LANGUAGE|>/PreExecutable")
endif()

add_executable( <|PROJECT_NAME|>
${SOURCES}
${PUBLIC_HEADERS}
${PRIVATE_HEADERS}
CMakeLists.txt
CMakeHeadersAndSources.txt
CMakeDependenciesAndLibraries.txt
)


target_link_libraries( <|PROJECT_NAME|>
${C_DEPENDENCIES_LIBRARIES}
${OS_SPECIFIC_LIBRARIES}
)

if( EXISTS "${MULLE_CMAKE_INCLUDE_DIR}/<|PROJECT_LANGUAGE|>/PostExecutable")
   include( "${MULLE_CMAKE_INCLUDE_DIR}/<|PROJECT_LANGUAGE|>/PostExecutable")
endif()

### Install

install( TARGETS <|PROJECT_NAME|> DESTINATION "bin")


#
# output message of a day to locate output
# but if create-build-motd doesn't exist, it's no biggy
#

set( MULLE_VIRTUAL_ROOT "$ENV{MULLE_VIRTUAL_ROOT}")
if( NOT MULLE_VIRTUAL_ROOT)
   set( MULLE_VIRTUAL_ROOT "${PROJECT_SOURCE_DIR}")
endif()

add_custom_target( __motd__ ALL
   COMMAND [ ! -x "\${MULLE_VIRTUAL_ROOT}/.mulle-sde/bin/create-build-motd" ] \
             || "\${MULLE_VIRTUAL_ROOT}/.mulle-sde/bin/create-build-motd" \
               "executable" "\${CMAKE_BINARY_DIR}" "<|PROJECT_NAME|>"
   COMMENT "Creating a motd file for mulle-craft" )

add_dependencies( __motd__ <|PROJECT_NAME|>)
