# Copyright 2013, 2019 Free Software Foundation, Inc.
#
# This file is part of GNU Radio
#
# GNU Radio is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3, or (at your option)
# any later version.
#
# GNU Radio is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with GNU Radio; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 51 Franklin Street,
# Boston, MA 02110-1301, USA.

include(CMakeFindDependencyMacro)

# Allows us to use all .cmake files in this directory
list(INSERT CMAKE_MODULE_PATH 0 "${CMAKE_CURRENT_LIST_DIR}")

find_dependency(LOG4CPP)
find_dependency(MPLIB)

set(BOOST_REQUIRED_COMPONENTS
    date_time
    program_options
    filesystem
    system
    regex
    thread
)

if (NOT ENABLE_TESTING)
  set(ENABLE_TESTING ON CACHE BOOL "Enable testing support")
endif()

if(ENABLE_TESTING)
  list(APPEND BOOST_REQUIRED_COMPONENTS unit_test_framework)
endif(ENABLE_TESTING)

find_dependency(Boost "1.65.1" COMPONENTS ${BOOST_REQUIRED_COMPONENTS})
find_dependency(Volk)
set(ENABLE_PYTHON ON CACHE BOOL "Enable Python & SWIG")
if(${ENABLE_PYTHON})
  set(PYTHON_EXECUTABLE /usr/bin/python3.6)
  include(GrPython)
endif()

include("${CMAKE_CURRENT_LIST_DIR}/gnuradio-pmtConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/gnuradio-runtimeConfig.cmake")
cmake_policy(SET CMP0012 NEW)
cmake_policy(SET CMP0057 NEW)

#Can't use Python if GNU Radio was built without support for it
if(${ENABLE_PYTHON})
  include("${CMAKE_CURRENT_LIST_DIR}/runtime_swigTargets.cmake")
endif()

# Propagate the enabledness of GRC:
# Since GRC doesn't contain proper CMake targets (yet?), we need to do this
# manually
set(ENABLE_GRC ON CACHE BOOL "Enable GRC features (export block YAML)")
if(ON)
  set(GRC_BLOCKS_DIR        "share/gnuradio/grc/blocks")
endif()
# Same for a few "special" features.
set(GR_PERFORMANCE_COUNTERS True)
set(GR_CTRLPORT             True)
set(GR_RPCSERVER_ENABLED    )
set(ENABLE_CTRLPORT_THRIFT  ON)
set(GR_RPCSERVER_THRIFT     )

# Propagate global options
set(GR_RUNTIME_DIR          "bin")
set(GR_LIBRARY_DIR          "lib")
set(GR_DATA_DIR             "share")
set(GR_PKG_DATA_DIR         "share/gnuradio")
set(GR_DOC_DIR              "share/doc")
set(GR_PKG_DOC_DIR          "share/doc/gnuradio-3.8.3git")
set(GR_LIBEXEC_DIR          "libexec")
set(GR_PKG_LIBEXEC_DIR      "libexec/gnuradio")
set(GR_THEMES_DIR           "share/gnuradio/themes")
set(GR_CONF_DIR             "etc")
set(SYSCONFDIR              "/usr/local/etc")
set(GR_PREFSDIR             "/usr/local/etc/gnuradio/conf.d")


# We check the requested components in the order given by the list below –
# ordering matters; we have module interdependencies.
set(GR_COMPONENTS
  blocks
  fec
  fft
  filter
  analog
  digital
  dtv
  audio
  channels
  qtgui
  trellis
  uhd
  video-sdl
  vocoder
  wavelet
  zeromq
  )

foreach(target ${GR_COMPONENTS})
  if (${target} IN_LIST Gnuradio_FIND_COMPONENTS)
    include("${CMAKE_CURRENT_LIST_DIR}/gnuradio-${target}Config.cmake")
  endif()
endforeach(target)
