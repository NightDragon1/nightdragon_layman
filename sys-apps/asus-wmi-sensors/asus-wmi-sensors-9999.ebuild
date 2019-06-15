# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils git-r3 linux-mod linux-info

DESCRIPTION="Linux HWMON (lmsensors) sensors driver for some ASUS Ryzen Motherboards"
HOMEPAGE="https://github.com/electrified/asus-wmi-sensors"
#SRC_URI=""
EGIT_REPO_URI="https://github.com/electrified/asus-wmi-sensors"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
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

	get_version
	get_running_version
	# Kernel Version check
	if ( [[ ${KV_MAJOR} -le 4 ]] && [[ ${KV_MINOR} -lt 100 ]] ); then
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
	else
		ebegin "Checking for CONFIG_HWMON enabled"
			linux_chkconfig_present HWMON
		eend $?
		ebegin "Checking for CONFIG_ACPI_WMI support enabled"
			linux_chkconfig_present ACPI_WMI
		eend $?
	fi
}

src_compile() {
	ebegin "Compiling..."
	die
	eend $?

}

src_install() {
	einfo "Install Module..."
}
