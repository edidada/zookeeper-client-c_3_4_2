# - Try to find CppUnit
# Once done this will define
#
#  CPPUNIT_FOUND - system has CppUnit
#  CPPUNIT_INCLUDE_DIRS - the CppUnit include directory
#  CPPUNIT_LIBRARIES - Link these to use CppUnit
#  CppUnit::CppUnit - imported target
#
# Copyright 2013 by the Apache Software Foundation

find_path(CPPUNIT_INCLUDE_DIR cppunit/Test.h
  HINTS ${CPPUNIT_ROOT}
  PATH_SUFFIXES include
)

find_library(CPPUNIT_LIBRARY
  NAMES cppunit
  HINTS ${CPPUNIT_ROOT}
  PATH_SUFFIXES lib lib64
)

set(CPPUNIT_LIBRARIES ${CPPUNIT_LIBRARY})
set(CPPUNIT_INCLUDE_DIRS ${CPPUNIT_INCLUDE_DIR})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(CppUnit DEFAULT_MSG CPPUNIT_LIBRARY CPPUNIT_INCLUDE_DIR)

mark_as_advanced(CPPUNIT_INCLUDE_DIR CPPUNIT_LIBRARY)

if(CPPUNIT_FOUND)
  if(NOT TARGET CppUnit::CppUnit)
    add_library(CppUnit::CppUnit UNKNOWN IMPORTED)
    set_target_properties(CppUnit::CppUnit PROPERTIES
      IMPORTED_LOCATION "${CPPUNIT_LIBRARY}"
      INTERFACE_INCLUDE_DIRECTORIES "${CPPUNIT_INCLUDE_DIR}")
  endif()
endif()
