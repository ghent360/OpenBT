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

PKG_NAME="fdk-aac"
PKG_VERSION="0.1.4"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="APACHE-2"
PKG_SITE="http://sourceforge.net/projects/opencore-amr/"
PKG_URL="http://skylineservers.dl.sourceforge.net/project/opencore-amr/fdk-aac/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain glibc"
PKG_PRIORITY="optional"
PKG_SECTION="audio"
PKG_SHORTDESC="fdk-aac: The Fraunhofer FDK AAC Codec Library"
PKG_LONGDESC="The Fraunhofer FDK AAC Codec Library for Android ('FDK AAC Codec') is software that implements the MPEG Advanced Audio Coding ('AAC') encoding and decoding scheme for digital audio. This FDK AAC Codec software is intended to be used on a wide variety of Android devices."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

# package specific configure options
PKG_CONFIGURE_OPTS_TARGET="ac_cv_func_malloc_0_nonnull=yes"

