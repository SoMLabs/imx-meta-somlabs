KERNEL_SRC = "git://github.com/SoMLabs/somlabs-linux-imx.git;protocol=http"
SRC_URI = "${KERNEL_SRC};branch=${KERNEL_BRANCH}"
KERNEL_BRANCH = "somlabs_imx_6.12.34-2.1.0"
SRCREV = "14826eab5c00f963b899bdc3b4eed2b737dc755c"
LINUX_VERSION = "6.12.34"
LOCALVERSION = "-somlabs"
PV = "${LINUX_VERSION}"

