include( "${MULLE_CMAKE_INCLUDE_DIR}/CompilerDetection.cmake")
include( "${MULLE_CMAKE_INCLUDE_DIR}/UnwantedWarnings.cmake")

if( EXISTS "${MULLE_CMAKE_INCLUDE_DIR}/PreLibraryCAux.cmake")
   include( "${MULLE_CMAKE_INCLUDE_DIR}/PreLibraryCAux.cmake")
endif()

