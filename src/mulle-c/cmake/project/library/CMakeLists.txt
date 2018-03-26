cmake_minimum_required( VERSION 3.0)

project( <|PROJECT_NAME|> <|PROJECT_UPCASE_LANGUAGE|>)


### mulle-sde environment

# add cmake module paths to search path
list( INSERT CMAKE_MODULE_PATH 0 "${PROJECT_SOURCE_DIR}/cmake/share")
list( INSERT CMAKE_MODULE_PATH 0 "${PROJECT_SOURCE_DIR}/cmake")

include( Environment)


### Files

include( PreFiles OPTIONAL)

set( <|PROJECT_UPCASE_IDENTIFIER|>_LIBRARY ON)

#
# Include all non underscored .cmake files in ./cmake
#
file( GLOB LOCAL_CMAKE_INCLUDES
   "cmake/[A-Za-z0-9]*.cmake"
)

foreach( FILE ${LOCAL_CMAKE_INCLUDES} )
   include( "${FILE}")
endforeach()


include_directories( ${INCLUDE_DIRS})

include( PostFiles OPTIONAL)

### Library

include( PreLibrary OPTIONAL)

add_library( "<|PROJECT_NAME|>"
${SOURCES}
${PUBLIC_HEADERS}
${PRIVATE_HEADERS}
${CMAKE_EDITABLE_FILES}
)

if( BUILD_SHARED_LIBS)
   target_link_libraries( <|PROJECT_NAME|>
${DEPENDENCY_LIBRARIES}
${OS_SPECIFIC_LIBRARIES}
)
endif()

include( PostLibrary OPTIONAL)


set( STANDALONE_BASE_NAME "<|PROJECT_NAME|>")
set( STANDALONE_NAME "<|PROJECT_NAME|>-standalone")
set( STANDALONE_DEFINITIONS ${<|PROJECT_UPCASE_IDENTIFIER|>_DEFINITIONS})
set( STANDALONE_DEPENDENCIES
<|PROJECT_NAME|>
)

set( STANDALONE_ALL_LOAD_LIBRARIES
$<TARGET_FILE:<|PROJECT_NAME|>>
${DEPENDENCY_LIBRARIES}
${OPTIONAL_DEPENDENCY_LIBRARIES}
${OS_SPECIFIC_LIBRARIES}
)

include( Standalone)

### Install

include( PreInstall OPTIONAL)

install( TARGETS "<|PROJECT_NAME|>" "<|PROJECT_NAME|>-standalone" DESTINATION "lib")
install( FILES ${PUBLIC_HEADERS}  DESTINATION "include/<|PROJECT_NAME|>")
install( FILES ${PRIVATE_HEADERS} DESTINATION "include/<|PROJECT_NAME|>/private")

install( FILES ${CMAKE_INCLUDES}  DESTINATION "include/<|PROJECT_NAME|>/cmake")

include( PostInstall OPTIONAL)
