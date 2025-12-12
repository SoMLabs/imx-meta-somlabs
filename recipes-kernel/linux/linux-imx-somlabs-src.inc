KERNEL_SRC = "git://github.com/SoMLabs/somlabs-linux-imx.git;protocol=http"
SRC_URI = "${KERNEL_SRC};branch=${KERNEL_BRANCH}"
KERNEL_BRANCH = "somlabs_imx_6.12.34-2.1.0"
SRCREV = "21dd84cb4524f774017e00ad5512da4a7d437943"
LINUX_VERSION = "6.12.34"
LOCALVERSION = "-somlabs"
PV = "${LINUX_VERSION}"

