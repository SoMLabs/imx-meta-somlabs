KERNEL_SRC = "git://github.com/SoMLabs/somlabs-linux-imx.git;protocol=http"
SRC_URI = "${KERNEL_SRC};branch=${KERNEL_BRANCH}"
KERNEL_BRANCH = "somlabs_imx_6.12.34-2.1.0"
SRCREV = "b970afbc57c3a0aa803146bcc9796e4d3a22651f"
LINUX_VERSION = "6.12.34"
LOCALVERSION = "-somlabs"
PV = "${LINUX_VERSION}"

