# can be included multiple times

if( MULLE_TRACE_INCLUDE)
   message( STATUS "# Include \"${CMAKE_CURRENT_LIST_FILE}\"" )
endif()

if( STARTUP_SOURCES)
   if( NOT STARTUP_LIBRARY_NAME)
      set( STARTUP_LIBRARY_NAME "<|PROJECT_NAME|>-startup")
   endif()
   if( NOT STARTUP_DEFINITIONS)
      set( STARTUP_DEFINITIONS ${<|PROJECT_UPCASE_IDENTIFIER|>_DEFINITIONS})
   endif()

   add_library( ${STARTUP_LIBRARY_NAME} STATIC
      ${STARTUP_SOURCES}
   )
   set_property( TARGET ${STARTUP_LIBRARY_NAME} PROPERTY CXX_STANDARD 11)

   target_compile_definitions( ${STARTUP_LIBRARY_NAME} PRIVATE ${STARTUP_DEFINITIONS})

   set( INSTALL_LIBRARY_TARGETS
      ${INSTALL_LIBRARY_TARGETS}
      ${STARTUP_LIBRARY_NAME}
   )

   set( STARTUP_LIBRARY
      $<TARGET_FILE:${STARTUP_LIBRARY_NAME}>
   )
else()
   option( OPTION_LINK_STARTUP_LIBRARY "Add a startup library to the executable" ON)

   #
   # This library contains ___get_or_create_mulle_objc_universe and
   # the startup code to create the universe
   #
   if( OPTION_LINK_STARTUP_LIBRARY)
      if( NOT STARTUP_LIBRARY)
         if( NOT STARTUP_LIBRARY_NAME)
            message( FATAL "STARTUP_LIBRARY_NAME is undefined (use Foundation if unsure)")
         endif()

         find_library( STARTUP_LIBRARY NAMES ${CMAKE_STATIC_LIBRARY_PREFIX}${STARTUP_LIBRARY_NAME}${CMAKE_STATIC_LIBRARY_SUFFIX}
                                             ${STARTUP_LIBRARY_NAME}
         )
      endif()

      set( DEPENDENCY_LIBRARIES
        ${DEPENDENCY_LIBRARIES}
        ${STARTUP_LIBRARY}
      )
   endif()
endif()

message( STATUS "STARTUP_LIBRARY_NAME is ${STARTUP_LIBRARY_NAME}")
message( STATUS "STARTUP_LIBRARY is ${STARTUP_LIBRARY}")

include( StartupCAux OPTIONAL)
