# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit eutils git-r3

DESCRIPTION="Raspberry Pi userspace tools and libraries"
HOMEPAGE="https://github.com/raspberrypi/userland"

KEYWORDS="arm64"

LICENSE="BSD"
SLOT="0"

EGIT_REPO_URI="git://github.com/ED6E0F17/userland.git"
EGIT_BRANCH="master"

src_compile() {
	${WORKDIR}/${P}/buildbrillo64
}

# testing only - userland needs a 32bit userspace
src_install() {
	mkdir -p ${D}/bin
	mkdir -p ${D}/lib
	exeinto bin
	if [-d ${WORKDIR}/${P}/build/bin ]; then
		doexe ${WORKDIR}/${P}/build/bin/*
		dolib ${WORKDIR}/${P}/build/lib/*so
	fi
}

