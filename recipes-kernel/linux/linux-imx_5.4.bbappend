FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

LOCALVERSION = "-lts-${KERNEL_BRANCH}"
KERNEL_SRC = "git://github.com/SoMLabs/somlabs-linux-imx.git;protocol=http"
SRC_URI = "${KERNEL_SRC};branch=${KERNEL_BRANCH} \
           "

KERNEL_BRANCH = "somlabs_imx_5.4.24_2.1.0"
SRCREV = "d0ce74ff14da6634880b70698f17dd6efeb2816e"

