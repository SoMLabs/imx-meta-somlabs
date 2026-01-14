KERNEL_SRC = "git://github.com/SoMLabs/somlabs-linux-imx.git;protocol=http"
SRC_URI = "${KERNEL_SRC};branch=${KERNEL_BRANCH}"
KERNEL_BRANCH = "somlabs_imx_6.12.34-2.1.0"
SRCREV = "c90816746267635a032c0a787f2aa5cb7d1389fa"
LINUX_VERSION = "6.12.34"
LOCALVERSION = "-somlabs"
PV = "${LINUX_VERSION}"

