# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils git-r3 linux-mod linux-info

DESCRIPTION="Linux HWMON (lmsensors) sensors driver for some ASUS Ryzen Motherboards"
HOMEPAGE="https://github.com/electrified/asus-wmi-sensors"
#SRC_URI=""
EGIT_REPI_URI="https://github.com/electrified/asus-wmi-sensors"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}/${MY_PN}

src_compile() {

	einfo "Check Kernel Version..."
	if [ [KV_MAJOR >= 4] && [KV_MAJOR >=20]]; then
 		e_warn "bla bla"
	 else 
 		e_warn "You need a kernel version euqal or later to 4.12!"
	 fi

}

src_install() {
	einfo "Install Module..."
}
