KERNEL_SRC = "git://github.com/SoMLabs/somlabs-linux-imx.git;protocol=http"
SRC_URI = "${KERNEL_SRC};branch=${KERNEL_BRANCH}"
KERNEL_BRANCH = "somlabs_imx_6.6.52-2.2.0"
SRCREV = "da588eb73d59fbf50f053c6bb7b05dc8c64936f0"
LINUX_VERSION = "6.6.52"
LOCALVERSION = "-somlabs"
PV = "${LINUX_VERSION}"

