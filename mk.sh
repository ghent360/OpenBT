#!/bin/sh
echo make $*
OFFICIAL=yes CONCURRENCY_MAKE_LEVEL=4 DISTRO=OpenBT PROJECT=RPi ARCH=arm make $*
