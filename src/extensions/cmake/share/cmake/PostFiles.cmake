set( LIBRARIES
${C_DEPENDENCIES_LIBRARIES}
${OS_SPECIFIC_LIBRARIES}
)

# a place to add stuff for ObjC or C++
if( EXISTS "${MULLE_CMAKE_INCLUDE_DIR}/PostFilesCAux.cmake")
   include( "${MULLE_CMAKE_INCLUDE_DIR}/PostFilesCAux.cmake")
endif()
