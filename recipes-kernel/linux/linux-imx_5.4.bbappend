FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

KERNEL_BRANCH_visionsom6ull = "imx_5.4.3_2.0.0"
LOCALVERSION_visionsom6ull = "-lts-${KERNEL_BRANCH}"
KERNEL_SRC_visionsom6ull = "git://github.com/SoMLabs/somlabs-linux-imx.git;protocol=http"
SRC_URI_visionsom6ull = "${KERNEL_SRC};branch=${KERNEL_BRANCH}"
SRCREV_visionsom6ull = "6d9670bb46b423e871097dc35ee826df744e7764"

IMX_KERNEL_CONFIG_AARCH32 = "somlabs-visionsom_defconfig"

