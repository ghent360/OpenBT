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

PKG_NAME="vdr-plugin-satip"
PKG_VERSION="18c9b79"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.saunalahti.fi/~rahrenbe/vdr/satip/"
PKG_GIT_URL="https://github.com/rofafor/vdr-plugin-satip.git"
PKG_GIT_BRANCH="vdr-2.2.x"
PKG_DEPENDS_TARGET="toolchain vdr curl tinyxml"
PKG_PRIORITY="optional"
PKG_SECTION="multimedia"
PKG_SHORTDESC="vdr-plugin-satip: SAT>IP plugin for VDR"
PKG_LONGDESC="vdr-plugin-satip is a SAT>IP plugin for VDR"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  VDR_DIR=$(get_pkg_build vdr)
  export PKG_CONFIG_PATH=$VDR_DIR:$PKG_CONFIG_PATH
  export CPLUS_INCLUDE_PATH=$VDR_DIR/include

  make \
    SATIP_USE_TINYXML=1 \
    LIBDIR="." \
    LOCDIR="./locale" \
    all install-i18n
}

post_make_target() {
  VDR_DIR=$(get_pkg_build vdr)
  VDR_APIVERSION=`sed -ne '/define APIVERSION/s/^.*"\(.*\)".*$/\1/p' $VDR_DIR/config.h`
  LIB_NAME=lib${PKG_NAME/-plugin/}

  cp --remove-destination $ROOT/$PKG_BUILD/${LIB_NAME}.so $ROOT/$PKG_BUILD/${LIB_NAME}.so.${VDR_APIVERSION}
  $STRIP libvdr-*.so*
}

makeinstall_target() {
  : # installation not needed, done by create-addon script
}
