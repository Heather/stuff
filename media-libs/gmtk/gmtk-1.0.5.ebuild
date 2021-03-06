# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4
inherit flag-o-matic toolchain-funcs

MY_P=${PN}-${PV/_beta/b}

DESCRIPTION="GTK+ widget and function libraries for gnome-mplayer"
HOMEPAGE="http://code.google.com/p/gmtk/"
SRC_URI="http://${PN}.googlecode.com/files/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~ppc ~ppc64 ~x86"
IUSE="alsa +dconf pulseaudio gtk3"

COMMON_DEPEND=">=dev-libs/glib-2.26
	|| ( gtk3? ( x11-libs/gtk+:3 ) x11-libs/gtk+:2 )
	x11-libs/libX11
	alsa? ( media-libs/alsa-lib )
	pulseaudio? ( media-sound/pulseaudio )"
RDEPEND="${COMMON_DEPEND}
	dconf? ( gnome-base/dconf )"
DEPEND="${COMMON_DEPEND}
	dev-util/intltool
	virtual/pkgconfig
	sys-devel/gettext"

DOCS=( ChangeLog )

S=${WORKDIR}/${MY_P}

src_configure() {
	if use gtk3;then
	  append-cppflags "$($(tc-getPKG_CONFIG) --cflags gtk+-3.0)"
	else
	  append-cppflags "$($(tc-getPKG_CONFIG) --cflags gtk+-2.0)"
	fi

	econf \
		--disable-static \
		$(use_enable gtk3) \
		$(use_enable dconf gsettings) \
		--disable-gconf \
		$(use_enable !dconf keystore) \
		--with-gio \
		$(use_with alsa) \
		$(use_with pulseaudio)
}

src_install() {
	default

	rm -rf \
		"${ED}"usr/share/doc/${PN} \
		"${ED}"usr/lib*/*.la
}
