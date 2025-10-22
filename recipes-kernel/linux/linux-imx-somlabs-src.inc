KERNEL_SRC = "git://github.com/SoMLabs/somlabs-linux-imx.git;protocol=http"
SRC_URI = "${KERNEL_SRC};branch=${KERNEL_BRANCH}"
KERNEL_BRANCH = "somlabs_imx_6.6.52-2.2.0"
SRCREV = "5dc1b0636b5f44b216bbf59ac644959d597ba953"
LINUX_VERSION = "6.6.52"
LOCALVERSION = "-somlabs"
PV = "${LINUX_VERSION}"

