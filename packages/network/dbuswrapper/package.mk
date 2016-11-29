################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
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

PKG_NAME="dbuswrapper"
PKG_VERSION="0b3a9996956"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="OTHER"
PKG_SITE="http://www.iqury.us/dbuswrapper"
PKG_GIT_URL="git@bitbucket.org:ghent360/dbuswrapper.git"
PKG_GIT_BRANCH="master"
PKG_DEPENDS_TARGET="toolchain dbus glog gflags"
PKG_PRIORITY="optional"
PKG_SECTION="network"
PKG_SHORTDESC="dbuswrapper: A small C++ wrapper library for d-bus."
PKG_LONGDESC="A small C++ wrapper library for d-bus."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET=""
