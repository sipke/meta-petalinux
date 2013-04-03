
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += " \
	file://oprofile-fix-config.h-inclusion.patch \
	file://oprofile-08d9173be36f3ffcdac80e0405326775aaf0b13c.patch \
	file://0001-opcontrol-Not-hardcode-the-bindir-path.patch \
	"

DEPENDS = " \
	popt \
	virtual/${TARGET_PREFIX}binutils \
	"
RDEPENDS_${PN} := ""
RRECOMMENDS_${PN} := ""

# ignore the dependency on the external toolchain *-dev package
INSANE_SKIP_${PN} += "dev-deps"
