cmake_minimum_required( VERSION 3.0)

project( <|PROJECT_NAME|> <|PROJECT_UPCASE_LANGUAGE|>)


### Files

if( NOT MULLE_CMAKE_INCLUDE_DIR)
   set( MULLE_CMAKE_INCLUDE_DIR "${PROJECT_SOURCE_DIR}/.mulle-sde/share/cmake")
endif()

if( EXISTS "${MULLE_CMAKE_INCLUDE_DIR}/PreFiles.cmake")
   include( "${MULLE_CMAKE_INCLUDE_DIR}/PreFiles.cmake")
else()
   message( ERROR "${MULLE_CMAKE_INCLUDE_DIR} is not properly set up yet.")
endif()

set( <|PROJECT_UPCASE_IDENTIFIER|>_LIBRARY ON)

include( CMakeHeadersAndSources.cmake)
include( CMakeDependenciesAndLibraries.cmake)


include_directories( ${INCLUDE_DIRS})

set( PUBLIC_HEADERS
${PUBLIC_HEADERS}
"CMakeDependenciesAndLibraries.cmake"
"_CMakeDependencies.cmake"
"_CMakeLibraries.cmake"
)

include( "${MULLE_CMAKE_INCLUDE_DIR}/PostFiles.cmake")

### Library

include( "${MULLE_CMAKE_INCLUDE_DIR}/PreLibrary.cmake")

add_library( "<|PROJECT_NAME|>"
${SOURCES}
${PUBLIC_HEADERS}
${PRIVATE_HEADERS}
CMakeLists.txt
CMakeHeadersAndSources.cmake
)

if( BUILD_SHARED_LIBS)
   target_link_libraries( <|PROJECT_NAME|>
${LIBRARIES}
)
endif()


include( "${MULLE_CMAKE_INCLUDE_DIR}/PostLibrary.cmake")

### Install

install( TARGETS "<|PROJECT_NAME|>" DESTINATION "lib")
install( FILES ${PUBLIC_HEADERS}  DESTINATION "include/<|PROJECT_NAME|>")
install( FILES ${PRIVATE_HEADERS} DESTINATION "include/<|PROJECT_NAME|>/private")
