#
# Set Search Paths
#
include( "${MULLE_CMAKE_INCLUDE_DIR}/CMakeTweaks.cmake")

### mulle-sde environment

set( MULLE_VIRTUAL_ROOT "$ENV{MULLE_VIRTUAL_ROOT}")
if( NOT MULLE_VIRTUAL_ROOT)
   set( MULLE_VIRTUAL_ROOT "${CMAKE_SOURCE_DIR}")
endif()
if( NOT DEPENDENCIES_DIR)
set( DEPENDENCIES_DIR "${MULLE_VIRTUAL_ROOT}/dependencies")
endif()
if( NOT ADDICTIONS_DIR)
set( ADDICTIONS_DIR "${MULLE_VIRTUAL_ROOT}/addictions")
endif()

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
set( CMAKE_PROGRAM_PATH "${DEPENDENCIES_DIR}/bin"
"${ADDICTIONS_DIR}/bin"
"${PROJECT_SOURCE_DIR}/.mulle-sde/bin"
${CMAKE_PROGRAM_PATH}
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


# a place to add stuff for ObjC or C++
if( EXISTS "${MULLE_CMAKE_INCLUDE_DIR}/PreFilesCAux.cmake")
   include( "${MULLE_CMAKE_INCLUDE_DIR}/PreFilesCAux.cmake")
endif()

