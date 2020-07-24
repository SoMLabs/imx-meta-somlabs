FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

UBOOT_SRC = "git://github.com/SoMLabs/somlabs-uboot-imx.git;protocol=https"
SRCBRANCH = "somlabs-lf-5.4.y_v2019.04"
SRC_URI = "${UBOOT_SRC};branch=${SRCBRANCH} \
           file://0001-SOMLABS-add-rotate-fbcon-argument-for-kernel.patch \
           "
SRCREV = "8be7d8d43de584953f9ae6c99adf9f4bd1e6c6a1"
