# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4

inherit eutils

DESCRIPTION="Infobar plugin for DeadBeeF audio player. Shows lyrics and artist's biography for the current track."
HOMEPAGE="https://bitbucket.org/dsimbiriatin/deadbeef-infobar/wiki/Home"
SRC_URI="mirror://bitbucket/dsimbiriatin/${PN}/downloads/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="gtk2 gtk3"
REQUIRED_USE="|| ( ${IUSE} )"

DEPEND_COMMON="
	|| (
		<media-sound/deadbeef-0.6[curl]
		<media-sound/deadbeef-0.6[cover]
		<media-sound/deadbeef-0.6[lastfm]
		)
	gtk2? ( <media-sound/deadbeef-0.6[gtk2] )
	gtk3? ( <media-sound/deadbeef-0.6[gtk3] )
	dev-libs/libxml2"

RDEPEND="
	${DEPEND_COMMON}
	"
DEPEND="
	${DEPEND_COMMON}
	"

src_compile() {
	if use gtk2; then
	  emake gtk2
	fi

	if use gtk3; then
	  emake gtk3
	fi
}

src_install() {
	if use gtk2; then
	  insinto /usr/$(get_libdir)/deadbeef
	  doins gtk2/ddb_infobar_gtk2.so
	fi

	if use gtk3; then
	  insinto /usr/$(get_libdir)/deadbeef
	  doins gtk3/ddb_infobar_gtk3.so
	fi
}
