#
# Set Search Paths
#

include( CMakeTweaks)

### mulle-sde environment

set( MULLE_VIRTUAL_ROOT "$ENV{MULLE_VIRTUAL_ROOT}")
if( NOT MULLE_VIRTUAL_ROOT)
   set( MULLE_VIRTUAL_ROOT "${PROJECT_SOURCE_DIR}")
endif()
include_directories( BEFORE SYSTEM
${MULLE_VIRTUAL_ROOT}/dependencies/include
${MULLE_VIRTUAL_ROOT}/addictions/include
)
set( CMAKE_LIBRARY_PATH "${MULLE_VIRTUAL_ROOT}/dependencies/lib"
"${MULLE_VIRTUAL_ROOT}/addictions/lib"
${CMAKE_LIBRARY_PATH}
)
set( CMAKE_FRAMEWORK_PATH "${MULLE_VIRTUAL_ROOT}/dependencies/Frameworks"
"${MULLE_VIRTUAL_ROOT}/addictions/Frameworks"
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

###



