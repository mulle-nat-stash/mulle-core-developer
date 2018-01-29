#
# Set Search Paths
#
include( "${MULLE_CMAKE_INCLUDE_DIR}/CMakeTweaks.cmake")

### mulle-sde environment

set( MULLE_VIRTUAL_ROOT "$ENV{MULLE_VIRTUAL_ROOT}")
if( NOT MULLE_VIRTUAL_ROOT)
   set( MULLE_VIRTUAL_ROOT "${PROJECT_SOURCE_DIR}")
endif()
set( DEPENDENCIES_DIR "${MULLE_VIRTUAL_ROOT}/dependencies")
set( ADDICTIONS_DIR "${MULLE_VIRTUAL_ROOT}/addictions")

https://github.com/madler/zlib/archive/v1.2.11.tar.gz
include_directories( BEFORE SYSTEM
${DEPENDENCIES_DIR}/include
${ADDICTIONS_DIR}/include
)
set( CMAKE_LIBRARY_PATH "${DEPENDENCIES_DIR}/lib"
"${ADDICTIONS_DIR}/lib"
${CMAKE_LIBRARY_PATH}
)
set( CMAKE_FRAMEWORK_PATH "${DEPENDENCIES_DIR}/Frameworks"
"${ADDICTIONS_DIR}/Frameworks"
${CMAKE_FRAMEWORK_PATH}
)


### Additional search paths based on build style

if( CMAKE_BUILD_STYLE STREQUAL "Debug")
   set( CMAKE_LIBRARY_PATH
      "${MULLE_VIRTUAL_ROOT}/dependencies/Debug/lib"
      ${CMAKE_LIBRARY_PATH}
   )
   set( CMAKE_FRAMEWORK_PATH
      "${MULLE_VIRTUAL_ROOT}/dependencies/Debug/Frameworks"
      ${CMAKE_FRAMEWORK_PATH}
   )
endif()
