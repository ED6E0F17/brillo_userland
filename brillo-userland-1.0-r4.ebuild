# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils git-2

DESCRIPTION="Raspberry Pi userspace tools and libraries"
HOMEPAGE="https://github.com/raspberrypi/userland"

KEYWORDS="arm"

LICENSE="BSD"
SLOT="0"

EGIT_REPO_URI="https://github.com/ED6E0F17/userland.git"
EGIT_BRANCH="brillo"
EGIT_COMMIT="115c367ffa95e9500b15e569b1ba485a157b4d0f"

src_prepare() {
	tc-export CXX
}

src_compile() {
	${WORKDIR}/${P}/buildbrillo
}

# installs libs into /system/usr/lib - avoiding libGL* conflicts in /system/lib
src_install() {
	mkdir -p ${D}/bin
	mkdir -p ${D}/lib
	exeinto bin
	doexe ${WORKDIR}/${P}/build/bin/*
	dolib ${WORKDIR}/${P}/build/lib/*so
}

