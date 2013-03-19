#
# Copyright (C) Xilinx Inc.
#

DESCRIPTION = "Basic PetaLinux Packages"
LICENSE = "NONE"

PR = "r1"

inherit packagegroup

PACKAGE_ARCH = "${MACHINE_ARCH}"

# 
RPROVIDES_${PN} += "petalinux-basic"
RREPLACES_${PN} += "petalinux-basic"
RCONFLICTS_${PN} += "petalinux-basic"

# Distro can override the following VIRTUAL-RUNTIME providers:
VIRTUAL-RUNTIME_dev_manager ?= "busybox-mdev"
VIRTUAL-RUNTIME_login_manager ?= "tinylogin"
VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
VIRTUAL-RUNTIME_initscripts ?= "initscripts"
VIRTUAL-RUNTIME_keymaps ?= "keymaps"

# Packages
RDEPENDS_${PN} = "\
	base-files \
	base-passwd \
	busybox \
	modutils-initscripts \
	netbase \
	${VIRTUAL-RUNTIME_initscripts} \
	${VIRTUAL-RUNTIME_login_manager} \
	${VIRTUAL-RUNTIME_init_manager} \
	${VIRTUAL-RUNTIME_dev_manager} \
	${VIRTUAL-RUNTIME_update-alternatives} \
	${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"

# Recommended
RRECOMMENDS_${PN} = "\
	${MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS}"