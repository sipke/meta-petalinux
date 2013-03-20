
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append += "file://inetd \
				file://inetd.conf \
				file://defconfig \
				"

PACKAGES =+ "${PN}-inetd"
INITSCRIPT_PACKAGES =+ "${PN}-inetd"
FILES_${PN}-inetd = "${sysconfdir}/init.d/inetd.${PN} ${sysconfdir}/inetd.conf"
INITSCRIPT_NAME_${PN}-inetd = "inetd.${PN}"
INITSCRIPT_PARAMS_${PN}-inetd = "start 65 S ."
CONFFILES_${PN}-inetd = "${sysconfdir}/inetd.conf"
