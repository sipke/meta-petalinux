
FILESEXTRAPATHS := "${THISDIR}/files"

BASEFILESISSUEINSTALL = "do_install_petalinuxissue"

do_install_petalinuxissue () {
	# Force null hostname
	echo "" > ${D}${sysconfdir}/hostname

	install -m 644 ${WORKDIR}/issue ${D}${sysconfdir}/issue
	install -m 644 ${WORKDIR}/issue ${D}${sysconfdir}/issue.net
	if [ -n "${DISTRO_NAME}" ]; then
		printf "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
		printf "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue.net
		if [ -n "${DISTRO_VERSION}" ]; then
			printf "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue
			printf "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue.net
		fi
		echo "\n \l" >> ${D}${sysconfdir}/issue
		echo >> ${D}${sysconfdir}/issue
		echo "%h"    >> ${D}${sysconfdir}/issue.net
		echo >> ${D}${sysconfdir}/issue.net
	fi
}