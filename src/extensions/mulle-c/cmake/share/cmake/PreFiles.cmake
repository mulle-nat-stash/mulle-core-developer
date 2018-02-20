#
# Set Search Paths
#
include( CMakeTweaks)


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
include( PreFilesCAux OPTIONAL)

