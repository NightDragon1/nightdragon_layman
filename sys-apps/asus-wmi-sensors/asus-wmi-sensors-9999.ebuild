# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils git-r3 linux-mod linux-info

DESCRIPTION="Linux HWMON (lmsensors) sensors driver for some ASUS Ryzen Motherboards"
HOMEPAGE="https://github.com/electrified/asus-wmi-sensors"
#SRC_URI=""
EGIT_REPO_URI="https://github.com/electrified/asus-wmi-sensors"

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
	if [ [ ${KV_MAJOR} -ge 4 ] && [ ${KV_MINOR} -ge 100 ] ]; then
 		ewarn "bla bla"
	 else 
 		eerror "You are using kernel version ${KV_MAJOR}.${KV_MINOR}.\n You need a kernel version euqal or later to 4.12!"
	    die
	 fi

}

src_install() {
	einfo "Install Module..."
}
