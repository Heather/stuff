# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils

DESCRIPTION="This KCM allows you to easily configure the standard Qt graphics system"
HOMEPAGE="http://kde-apps.org/content/show.php?content=129817"
SRC_URI="http://kde-apps.org/CONTENT/content-files/129817-kcm-qt-graphicssystem-${PV}.tar.xz"

LICENSE="GPL-1"
SLOT="0"
KEYWORDS="-alpha ~amd64 -ppc64 -sparc ~x86"
IUSE=""

DEPEND_COMMON="
		kde-base/kdelibs
		dev-qt/qtgui:4
		dev-qt/qtcore:4
	"
RDEPEND="
	${DEPEND_COMMON}
	"
DEPEND="
	${DEPEND_COMMON}
	"
S="${WORKDIR}/${PF}"

src_compile() {
	cmake -DCMAKE_INSTALL_PREFIX=/usr "${S}"
	emake || die "emake failed"
}

src_install() {
	make DESTDIR="${D}" install || die "make install failed"
}
