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

PKG_NAME="soxr"
PKG_VERSION="0.1.2"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="LGPL"
PKG_SITE="http://sourceforge.net/projects/opencore-amr/"
PKG_URL="http://iweb.dl.sourceforge.net/project/soxr/$PKG_NAME-$PKG_VERSION-Source.tar.xz"
PKG_DEPENDS_TARGET="toolchain cmake:host glibc"
PKG_PRIORITY="optional"
PKG_SECTION="audio"
PKG_SHORTDESC="libsoxr: High quality, one-dimensional sample-rate conversion library"
PKG_LONGDESC="The SoX Resampler library libsoxr performs one-dimensional sample-rate conversion—it may be used, for example, to resample PCM-encoded audio.

It aims to give fast and high quality results for any constant (rational or irrational) resampling ratio. Phase-response, preserved bandwidth, aliasing, and rejection level parameters are all configurable; alternatively, simple preset configurations may be selected. An experimental, variable-rate resampling mode of operation is also included."
PKG_SOURCE_DIR="$PKG_NAME-$PKG_VERSION-Source"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

configure_target() {
  cmake -DCMAKE_TOOLCHAIN_FILE=$CMAKE_CONF \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DHAVE_WORDS_BIGENDIAN_EXITCODE=1 \
        -DBUILD_TESTS=0 \
        -DBUILD_EXAMPLES=0 \
        -DWITH_LSR_BINDINGS=0 \
        -Wno-dev \
        ..
}

post_makeinstall_target() {
  echo Post Install
  #mv $SYSROOT_PREFIX/usr/lib/libyajl_s.a $SYSROOT_PREFIX/usr/lib/libyajl.a
  #rm $SYSROOT_PREFIX/usr/lib/libyajl.so*
  #rm -rf $INSTALL/usr/bin
  #rm -rf $INSTALL/usr/lib
}

