KERNEL_SRC = "git://github.com/SoMLabs/somlabs-linux-imx.git;protocol=http"
SRC_URI = "${KERNEL_SRC};branch=${KERNEL_BRANCH}"
KERNEL_BRANCH = "somlabs_imx_6.6.52-2.2.0"
SRCREV = "a0389a59107077b1b23580866f75f886dadae113"
LINUX_VERSION = "6.6.52"
LOCALVERSION = "-somlabs"
PV = "${LINUX_VERSION}"

