# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils git-r3 linux-mod linux-info

DESCRIPTION="Linux HWMON (lmsensors) sensors driver for some ASUS Ryzen Motherboards"
HOMEPAGE="https://github.com/electrified/asus-wmi-sensors"
EGIT_REPO_URI="https://github.com/electrified/asus-wmi-sensors"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="sys-apps/lm_sensors"
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}/${MY_P}

pkg_pretend() {
	einfo "Checking preconditions..."

	# Check for kernel sources...
	if [ ! linux_config_src_exists ]; then
		eerror "Kernel sources not found!"
		die
	fi
	CONFIG_CHECK="HWMON ACPI_WMI"
	linux-info_pkg_setup
	# Kernel Version check
	if kernel_is lt 4 12; then
		eerror "Found kernel version ${KV_MAJOR}.${KV_MINOR}, but need 4.12 or higher!"
	    die
	fi
	# Kenerl config check
	if [ ! linux_config_exists ]; then
		eerror "Kernel config file (.config) not found!"
		die
	elif  [ ! check_modules_supported ]; then
		eerror "This kernel does not support modules!"
		die
	fi
	MODULE_NAMES="asus-wmi-sensors(hwmon:${S})"
}

src_compile() {
	ebegin "Compiling..."
	eend $?

}

src_install() {
	einfo "Install Module..."
	linux-mod_src_install
}
