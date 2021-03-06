# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

DESCRIPTION="Compiz Fusion (meta)"
HOMEPAGE="http://www.compiz.org/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="emerald gnome kde unsupported"

MY_PV=0.8.4

RDEPEND="
	>=x11-wm/compiz-${PV}
	>=x11-plugins/compiz-plugins-main-${PV}
	>=x11-plugins/compiz-plugins-extra-${PV}
	unsupported? ( >=x11-plugins/compiz-plugins-unsupported-${MY_PV} )
	>=x11-apps/ccsm-${MY_PV}
	emerald? ( >=x11-wm/emerald-${MY_PV} )
	gnome? ( >=x11-libs/compizconfig-backend-gconf-${MY_PV} )
	kde? ( >=x11-libs/compizconfig-backend-kconfig4-${MY_PV} )"

pkg_postinst() {
	ewarn "If you want to try out simple-ccsm, you'll need to emerge it"
	ewarn "If you want to use emerald, set the emerald use flag"
}
