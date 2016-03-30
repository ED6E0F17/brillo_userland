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
EGIT_COMMIT="5a6d2988f4d646cbb6c0b8cf37096291174a2119"

pkg_setup() {
	append-ldflags $(no-as-needed)
}

src_prepare() {
	tc-export CXX
}

src_compile() {
	${WORKDIR}/${P}/buildbrillo
}

src_install() {
	mkdir -p ${D}/bin
	mkdir -p ${D}/lib
	exeinto bin
	doexe ${WORKDIR}/${P}/build/bin/*
	dolib ${WORKDIR}/${P}/build/lib/*so
}

