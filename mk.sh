#!/bin/sh
echo make $*
OFFICIAL=yes OPENELEC_VERSION=7.0-bt CONCURRENCY_MAKE_LEVEL=4 DISTRO=OpenBT PROJECT=RPi ARCH=arm make $*
#DEBUG=yes CONCURRENCY_MAKE_LEVEL=4 DISTRO=OpenBT PROJECT=RPi ARCH=arm make $*