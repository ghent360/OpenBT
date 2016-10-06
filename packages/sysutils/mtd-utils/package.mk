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

PKG_NAME="mtd-utils"
PKG_VERSION="e4c8885bddac"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.linux-mtd.infradead.org/"
PKG_GIT_URL="git://git.infradead.org/mtd-utils.git"
PKG_GIT_BRANCH="master"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="sysutils"
PKG_SHORTDESC="mtd-utils"
PKG_LONGDESC="tools to create dope filesystems on flash deices."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  make CC=$TARGET_CC \
       AR=$TARGET_AR \
       RANLIB=$TARGET_RANLIB \
       CFLAGS="$TARGET_CFLAGS" \
       BUILD_CC=$HOST_CC \
       BUILD_CFLAGS="$HOST_CFLAGS -I$ROOT/$PKG_BUILD/libcap/include" \
       WITHOUT_XATTR=1 \
       lib=/lib
}

