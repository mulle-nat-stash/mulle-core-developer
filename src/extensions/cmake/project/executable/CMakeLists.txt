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


include( CMakeHeadersAndSources.cmake)
include( CMakeDependenciesAndLibraries.cmake)


include( "${MULLE_CMAKE_INCLUDE_DIR}/PostFiles.cmake")

### Executable

include( "${MULLE_CMAKE_INCLUDE_DIR}/PreExecutable.cmake")


add_executable( <|PROJECT_NAME|>
${SOURCES}
${PUBLIC_HEADERS}
${PRIVATE_HEADERS}
CMakeLists.txt
CMakeHeadersAndSources.cmake
CMakeDependenciesAndLibraries.cmake
)


target_link_libraries( <|PROJECT_NAME|>
${LIBRARIES}
)

include( "${MULLE_CMAKE_INCLUDE_DIR}/PostExecutable.cmake")

### Install

install( TARGETS <|PROJECT_NAME|> DESTINATION "bin")


#
# Output message of a day to locate output.
# But if create-build-motd doesn't exist, it's no biggy
#
add_custom_target( __motd__ ALL
   COMMAND [ ! -x "${MULLE_VIRTUAL_ROOT}/.mulle-sde/bin/create-build-motd" ] || "${MULLE_VIRTUAL_ROOT}/.mulle-sde/bin/create-build-motd" "executable" "${CMAKE_BINARY_DIR}" "<|PROJECT_NAME|>"
   COMMENT "Creating a motd file for mulle-craft"
)
add_dependencies( __motd__ <|PROJECT_NAME|>)
