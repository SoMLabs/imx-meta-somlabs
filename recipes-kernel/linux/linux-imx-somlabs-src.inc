KERNEL_SRC = "git://github.com/SoMLabs/somlabs-linux-imx.git;protocol=http"
SRC_URI = "${KERNEL_SRC};branch=${KERNEL_BRANCH}"
KERNEL_BRANCH = "somlabs_imx_6.6.52-2.2.0"
SRCREV = "b33205180cd62de79177b8eba8a8c86f775ca855"
LINUX_VERSION = "6.6.52"
LOCALVERSION = "-somlabs"
PV = "${LINUX_VERSION}"

