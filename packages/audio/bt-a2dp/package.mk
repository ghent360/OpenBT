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

PKG_NAME="bt-a2dp"
PKG_VERSION="1.2"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="APACHE-2"
PKG_SITE="http://iquri.us/a2dp"
PKG_URL="http://localhost/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain glibc alsa-lib glog gflags espeak libgcrypt lzo libvorbis libogg"
PKG_PRIORITY="optional"
PKG_SECTION="audio"
PKG_SHORTDESC="bt-a2dp: Bluetoothe A2DB sink daemon"
PKG_LONGDESC="This package lets unicorns out of the speakers."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

# package specific configure options
PKG_CONFIGURE_OPTS_TARGET="ac_cv_func_malloc_0_nonnull=yes"

post_makeinstall_target() {
  echo rm -rf $INSTALL/lib $INSTALL/var
}

post_install() {
  ln -sf a2dp.target $INSTALL/usr/lib/systemd/system/default.target
  enable_service a2dp.service
}

