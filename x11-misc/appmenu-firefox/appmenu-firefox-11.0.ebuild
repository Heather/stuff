# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Appmenu support for Firefox"
HOMEPAGE="https://code.launchpad.net/~extension-hackers/globalmenu-extension"
SRC_URI="( x86? ( http://ubuntu.mirror.cambrium.nl/ubuntu//pool/main/f/firefox/firefox-globalmenu_${PV}+build1-0ubuntu3_i386.deb )
		 amd64? ( http://ubuntu.mirror.cambrium.nl/ubuntu//pool/main/f/firefox/firefox-globalmenu_${PV}+build1-0ubuntu3_amd64.deb )
		 )"

LICENSE="|| ( MPL-1.1 GPL-2 LGPL-2.1 )"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="|| ( >=www-client/firefox-${PV} >=www-client/firefox-bin-${PV} )
		x11-misc/appmenu-gtk[gtk2]
		app-text/gnome-doc-utils"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

QA_PRESTRIPPED="//usr/lib/firefox/extensions/globalmenu@ubuntu.com/components/libglobalmenu.so"

src_unpack() {
  unpack ${A}
  unpack ./data.tar.gz
}

src_install() {
  mv usr/lib/firefox-addons usr/lib/firefox
  cp -R usr "${D}"
  dosym "/usr/lib/firefox/extensions/globalmenu@ubuntu.com" "/opt/firefox/extensions/globalmenu@ubuntu.com"
}