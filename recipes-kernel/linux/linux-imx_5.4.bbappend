FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

KERNEL_BRANCH = "imx_5.4.3_2.0.0"
LOCALVERSION = "-lts-${KERNEL_BRANCH}"
KERNEL_SRC = "git://github.com/SoMLabs/somlabs-linux-imx.git;protocol=http"
SRC_URI = "${KERNEL_SRC};branch=${KERNEL_BRANCH}"
SRCREV = "cd64dd9282a32d35828be1f480151f1feed02068"

IMX_KERNEL_CONFIG_AARCH32 = "somlabs-visionsom_defconfig"

