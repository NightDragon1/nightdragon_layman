# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils git-r3 linux-mod linux-info

DESCRIPTION="Linux HWMON (lmsensors) sensors driver for ASus Prime X399-A (pwm controls too)"
HOMEPAGE="https://github.com/NightDragon1/hwmon-it87"
EGIT_REPO_URI="https://github.com/NightDragon1/hwmon-it87"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="sys-apps/lm_sensors"
RDEPEND="${DEPEND}"
BDEPEND=""

BUILD_TARGETS="clean modules"
MODULE_NAMES="hwmon-it87(kernel/drivers/hwmon:${S})"

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
}

pkg_setup() {
	linux-mod_pkg_setup
}

src_configure() {
	set_arch_to_kernel
	if [[ -x ${ECONF_SOURCE:-.}/configure ]] ; then
		econf
	fi
}

src_compile() {
	#emake || die "Make failed!"
	linux-mod_src_compile
}

src_install() {
	linux-mod_src_install
}

pkg_preinst() {
	return
}
