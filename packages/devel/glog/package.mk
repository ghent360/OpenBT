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

PKG_NAME="glog"
PKG_VERSION="0.3.3"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="BSD_3"
PKG_SITE="https://code.google.com/p/google-glog/"
PKG_URL="https://google-glog.googlecode.com/files/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain zlib gflags"
PKG_PRIORITY="optional"
PKG_SECTION="devel"
PKG_SHORTDESC="Gogle glog support library"
PKG_LONGDESC="The glog library implements application-level logging. This library provides logging APIs based on C++-style streams and various helper macros."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET=

