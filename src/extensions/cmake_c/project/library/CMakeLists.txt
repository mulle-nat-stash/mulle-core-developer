cmake_minimum_required( VERSION 3.0)

project( <|PROJECT_NAME|> <|PROJECT_LANGUAGE|>)


### Files

if( NOT MULLE_CMAKE_INCLUDE_DIR)
   set( MULLE_CMAKE_INCLUDE_DIR "${PROJECT_SOURCE_DIR}/.mulle-sde/share/cmake")
endif()

if( EXISTS "${MULLE_CMAKE_INCLUDE_DIR}/<|PROJECT_LANGUAGE|>/PreFiles")
   include( "${MULLE_CMAKE_INCLUDE_DIR}/<|PROJECT_LANGUAGE|>/PreFiles")
endif()


set( <|PROJECT_UPCASE_IDENTIFIER|>_LIBRARY ON)

include( CMakeDependenciesAndLibraries.txt)
include( CMakeHeadersAndSources.txt)


include_directories( ${INCLUDE_DIRS})

set( PUBLIC_HEADERS
${PUBLIC_HEADERS}
"CMakeDependenciesAndLibraries.txt"
"_CMakeDependencies.txt"
"_CMakeLibraries.txt"
)

if( EXISTS "${MULLE_CMAKE_INCLUDE_DIR}/<|PROJECT_LANGUAGE|>/PostFiles")
   include( "${MULLE_CMAKE_INCLUDE_DIR}/<|PROJECT_LANGUAGE|>}/PostFiles")
endif()

### Library

if( EXISTS "${MULLE_CMAKE_INCLUDE_DIR}/<|PROJECT_LANGUAGE|>}/PreLibrary")
   include( "${MULLE_CMAKE_INCLUDE_DIR}/<|PROJECT_LANGUAGE|>/PreLibrary")
endif()

add_library( "<|PROJECT_NAME|>"
${SOURCES}
${PUBLIC_HEADERS}
${PRIVATE_HEADERS}
CMakeLists.txt
CMakeHeadersAndSources.txt
)

if( BUILD_SHARED_LIBS)
   target_link_libraries( <|PROJECT_NAME|>
${C_DEPENDENCIES_LIBRARIES}
${OS_SPECIFIC_LIBRARIES}
)
endif()


if( EXISTS "${MULLE_CMAKE_INCLUDE_DIR}/<|PROJECT_LANGUAGE|>/PostLibrary")
   include( "${MULLE_CMAKE_INCLUDE_DIR}/<|PROJECT_LANGUAGE|>/PostLibrary")
endif()

### Install

install( TARGETS "<|PROJECT_NAME|>" DESTINATION "lib")
install( FILES ${PUBLIC_HEADERS}  DESTINATION "include/<|PROJECT_NAME|>")
install( FILES ${PRIVATE_HEADERS} DESTINATION "include/<|PROJECT_NAME|>/private")
