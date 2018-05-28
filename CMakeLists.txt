cmake_minimum_required( VERSION 3.0)

project( mulle-c-developer NONE)

set( PROJECT_VERSION 0.4.14)

set( EXTENSIONS
src/  # backslash is important
)


install( DIRECTORY ${EXTENSIONS}
DESTINATION "share/mulle-sde/extensions"
USE_SOURCE_PERMISSIONS)


######
#
# must be after CPACK_PACKAGE_VERSION
include( CMakePackage.cmake)
include( CPack)
