KERNEL_SRC = "git://github.com/SoMLabs/somlabs-linux-imx.git;protocol=http"
SRC_URI = "${KERNEL_SRC};branch=${KERNEL_BRANCH}"
KERNEL_BRANCH = "somlabs_imx_6.6.52-2.2.0"
SRCREV = "4faa23b5dcc062662bb70b5cafd38de62cb01f3a"
LINUX_VERSION = "6.6.52"
LOCALVERSION = "-somlabs"
PV = "${LINUX_VERSION}"

