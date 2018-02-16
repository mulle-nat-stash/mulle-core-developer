cmake_minimum_required( VERSION 3.0)

project( mulle-c-developer NONE)

set( PROJECT_VERSION 0.0.0)

set( SCRIPTS)
mulle-c-sourcetree-update
)

set( EXTENSIONS
src/extensions
)

INSTALL( FILES ${SCRIPTS}
PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ
            GROUP_EXECUTE GROUP_READ
            WORLD_EXECUTE WORLD_READ
DESTINATION "bin")


INSTALL( DIRECTORY ${EXTENSIONS}
DESTINATION "share/mulle-sde")


######
#
# must be after CPACK_PACKAGE_VERSION
include( CMakePackage)
include( CPack)
