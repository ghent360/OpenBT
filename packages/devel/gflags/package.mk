################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2014 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="gflags"
PKG_VERSION="2.1.2"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="BSD_3"
PKG_SITE="https://code.google.com/p/gflags/"
PKG_URL="https://github.com/schuhschuh/gflags/archive/v$PKG_VERSION.tar.gz"
PKG_GET_FORMAT_OUTPUT=yes
PKG_DEPENDS_TARGET="toolchain cmake:host"
PKG_PRIORITY="optional"
PKG_SECTION="devel"
PKG_SHORTDESC="gflags: Google gflags library"
PKG_LONGDESC="The gflags package contains a library that implements commandline flags processing. As such it's a replacement for getopt(). It has increased flexibility, including built-in support for C++ types like string, and the ability to define flags in the source file in which they're used."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

configure_target() {
  cmake -DCMAKE_TOOLCHAIN_FILE=$CMAKE_CONF \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=true \
        ..
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr/lib/cmake
  rm -rf $INSTALL/usr/bin
}

