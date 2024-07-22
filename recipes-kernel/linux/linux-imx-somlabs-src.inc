KERNEL_SRC = "git://github.com/SoMLabs/somlabs-linux-imx.git;protocol=http"
SRC_URI = "${KERNEL_SRC};branch=${KERNEL_BRANCH}"
KERNEL_BRANCH = "somlabs_imx_6.6.23-2.0.0"
SRCREV = "722df7014352a20aa2f0a71b9551bdae54dc23ad"
LINUX_VERSION = "6.6.23"
LOCALVERSION = "-somlabs"
PV = "${LINUX_VERSION}"

