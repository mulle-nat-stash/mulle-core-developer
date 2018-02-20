cmake_minimum_required( VERSION 3.0)

project( mulle-c-developer NONE)

set( PROJECT_VERSION 0.4.0)

set( EXTENSIONS
src/extensions
)


INSTALL( DIRECTORY ${EXTENSIONS}
DESTINATION "share/mulle-sde")


######
#
# must be after CPACK_PACKAGE_VERSION
include( CMakePackage)
include( CPack)
