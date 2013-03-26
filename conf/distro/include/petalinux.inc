#@TYPE: Distribution
#@NAME: PetaLinux
#@DESCRIPTION: PetaLinux distribution configuration

USERDISTRO := "${DISTRO}"
DISTRO = "petalinux"
DISTRO_NAME = "PetaLinux"

TARGET_VENDOR = "-petalinux"
TCLIBCAPPEND = ""

# Override the virtual runtimes
VIRTUAL-RUNTIME_dev_manager ?= "busybox-mdev"
VIRTUAL-RUNTIME_login_manager ?= "tinylogin"
VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
VIRTUAL-RUNTIME_initscripts ?= "initscripts"
VIRTUAL-RUNTIME_keymaps ?= "keymaps"

# Override the provider for virtual/gettext
PREFERRED_PROVIDER_virtual/gettext ?= "gettext"

# Override these in petalinux based distros to modify DISTRO_EXTRA_R*
DISTRO_EXTRA_RDEPENDS += " packagegroup-petalinux-basic"

# Default hash policy for distro
BB_SIGNATURE_HANDLER ?= 'OEBasicHash'
#
# OELAYOUT_ABI allows us to notify users when the format of TMPDIR changes in 
# an incompatible way. Such changes should usually be detailed in the commit
# that breaks the format and have been previously discussed on the mailing list 
# with general agreement from the core team.
#
OELAYOUT_ABI = "8"

# add poky sanity bbclass
INHERIT += "poky-sanity"

WARN_QA = "textrel pkgvarcheck"
ERROR_QA = "dev-so debug-deps dev-deps debug-files arch la2 pkgconfig la perms useless-rpaths rpaths staticdev ldflags"

# BusyBox features
DISTRO_FEATURES += "busybox-hd \
	busybox-ftpd \
	busybox-ftp \
	busybox-telnetd \
	busybox-mdev \
	busybox-inetd \
	busybox-httpd \
	busybox-bzip2 \
	ipv4 \
	ipv6 \
	"
