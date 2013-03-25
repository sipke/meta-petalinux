
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append += "file://inetd \
                file://inetd.conf \
                file://defconfig \
                "

PACKAGES =+ "${@plnx_enable_busybox_package('inetd', d)}"
INITSCRIPT_PACKAGES =+ "${@plnx_enable_busybox_package('inetd', d)}"
FILES_${PN}-inetd = "${sysconfdir}/init.d/inetd.${PN} ${sysconfdir}/inetd.conf"
INITSCRIPT_NAME_${PN}-inetd = "inetd.${PN}"
INITSCRIPT_PARAMS_${PN}-inetd = "start 65 S ."
CONFFILES_${PN}-inetd = "${sysconfdir}/inetd.conf"

def plnx_enable_busybox_package(f, d):
    distro_features = d.getVar('DISTRO_FEATURES', True).split()
    if f in distro_features:
        return "${PN}-" + f
    else:
        return ""

def plnx_features_to_busybox_settings(d):
    distro_features = d.getVar('DISTRO_FEATURES', True).split()
    cnf, rem = ([], [])
    busybox_cfg('busybox-mdev', distro_features, \
        ["CONFIG_MDEV CONFIG_FEATURE_MDEV_CONF", \
        "CONFIG_FEATURE_MDEV_RENAME", \
        "CONFIG_FEATURE_MDEV_RENAME_REGEXP", \
        "CONFIG_FEATURE_MDEV_EXEC", \
        "CONFIG_FEATURE_MDEV_LOAD_FIRMWARE" \
        ], cnf, rem)
    busybox_cfg('busybox-ftpd', distro_features, \
        ["CONFIG_FTPD", \
        "CONFIG_FEATURE_FTP_WRITE", \
        "CONFIG_FEATURE_FTPD_ACCEPT_BROKEN_LIST" \
        ], cnf, rem)
    busybox_cfg('busybox-ftp', distro_features, \
        ["CONFIG_FTPGET", \
        "CONFIG_FTPPUT", \
        "CONFIG_FEATURE_FTPGETPUT_LONG_OPTIONS" \
        ], cnf, rem)
    busybox_cfg('busybox-ps', distro_features, \
        ["CONFIG_PS", \
        "CONFIG_FEATURE_PS_WIDE", \
        "CONFIG_FEATURE_PS_LONG", \
        "CONFIG_FEATURE_PS_TIME", \
        "CONFIG_FEATURE_PS_ADDITIONAL_COLUMNS" \
        ], cnf, rem)
    busybox_cfg('busybox-telnetd', distro_features, \
        ["CONFIG_TELNETD", \
        "CONFIG_FEATURE_TELNETD_STANDALONE", \
        "CONFIG_FEATURE_TELNETD_INETD_WAIT" \
        ], cnf, rem)
    busybox_cfg('busybox-tftpd', distro_features, \
        ["CONFIG_TFTPD" \
        ], cnf, rem)
    busybox_cfg('busybox-inetd', distro_features, \
        ["CONFIG_INETD", \
        "CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO", \
        "CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD", \
        "CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME", \
        "CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME", \
        "CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN", \
        "CONFIG_FEATURE_INETD_RPC" \
        ], cnf, rem)
    busybox_cfg('busybox-httpd', distro_features, \
        ["CONFIG_HTTPD", \
        "CONFIG_FEATURE_HTTPD_RANGES", \
        "CONFIG_FEATURE_HTTPD_USE_SENDFILE", \
        "CONFIG_FEATURE_HTTPD_SETUID", \
        "CONFIG_FEATURE_HTTPD_BASIC_AUTH", \
        "CONFIG_FEATURE_HTTPD_AUTH_MD5", \
        "CONFIG_FEATURE_HTTPD_CGI", \
        "CONFIG_FEATURE_HTTPD_CONFIG_WITH_SCRIPT_INTERPR", \
        "CONFIG_FEATURE_HTTPD_SET_REMOTE_PORT_TO_ENV", \
        "CONFIG_FEATURE_HTTPD_ENCODE_URL_STR", \
        "CONFIG_FEATURE_HTTPD_ERROR_PAGES", \
        "CONFIG_FEATURE_HTTPD_PROXY", \
        "CONFIG_FEATURE_HTTPD_GZIP" \
        ], cnf, rem)
    busybox_cfg('busybox-ifconfig', distro_features, \
        ["CONFIG_IFCONFIG", \
        "CONFIG_FEATURE_IFCONFIG_STATUS", \
        "CONFIG_FEATURE_IFCONFIG_SLIP", \
        "CONFIG_FEATURE_IFCONFIG_MEMSTART_IOADDR_IRQ", \
        "CONFIG_FEATURE_IFCONFIG_HW", \
        "CONFIG_FEATURE_IFCONFIG_BROADCAST_PLUS" \
        ], cnf, rem)
    busybox_cfg('busybox-hd', distro_features, \
        ["CONFIG_HEXDUMP", \
        "CONFIG_FEATURE_HEXDUMP_REVERSE", \
        "CONFIG_HD", \
        ], cnf, rem)
    return "\n" + "\n".join(cnf), "\n" + "\n".join(rem)

def plnx_features_to_busybox_conf(d):
    cnf, rem = plnx_features_to_busybox_settings(d)
    return cnf
def plnx_features_to_busybox_del(d):
    cnf, rem = plnx_features_to_busybox_settings(d)
    return rem

OE_FEATURES += "${@plnx_features_to_busybox_conf(d)}"
OE_DEL      += "${@plnx_features_to_busybox_del(d)}"
