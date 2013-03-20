#
# Copyright (C) Xilinx Inc.
#

DESCRIPTION = "PetaLinux World Packages, all packages avaliable in PetaLinux"
LICENSE = "NONE"

PR = "r1"

inherit packagegroup

PACKAGE_ARCH = "${MACHINE_ARCH}"

# 
RPROVIDES_${PN} += "petalinux-world"
RREPLACES_${PN} += "petalinux-world"
RCONFLICTS_${PN} += "petalinux-world"

# Packages
RDEPENDS_${PN} = "\
	dropbear \
	zlib \
	mtd-utils \
	strace \
	netperf \
	"

# Recommended
#RRECOMMENDS_${PN} = ""
