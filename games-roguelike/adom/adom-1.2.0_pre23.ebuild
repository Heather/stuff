# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="4"

inherit eutils games

DESCRIPTION="Ancient Domains Of Mystery rogue-like game"
HOMEPAGE="http://www.adom.de/"
SRC_URI="
x86? ( http://www.ancardia.com/download/${PN}_linux_debian_32_${PV}.tar.gz )
amd64? ( http://www.ancardia.com/download/${PN}_linux_debian_64_${PV}.tar.gz )
arm? ( http://www.ancardia.com/download/${PN}_linux_arm_${PV}.tar.gz )"

LICENSE="adom"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""
RESTRICT="strip" #bug #137340
QA_FLAGS_IGNORED="${GAMES_BINDIR}/${PN}"

DEPEND="!arm? ( >=sys-libs/ncurses-5.0[tinfo] )"

S=${WORKDIR}/${PN}

src_install() {
	exeinto "${GAMES_BINDIR}"
	doexe adom

	edos2unix docs/{adomfaq.txt,manual.txt,readme1st.txt}
	dodoc docs/{adomfaq.txt,manual.txt,readme1st.txt}

	prepgamesdirs
	fperms g+w "${GAMES_BINDIR}/${PN}"
}
