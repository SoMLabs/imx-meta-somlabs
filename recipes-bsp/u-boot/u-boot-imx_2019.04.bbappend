FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

UBOOT_SRC = "git://github.com/SoMLabs/somlabs-uboot-imx.git;protocol=https"
SRCBRANCH = "somlabs-lf-5.4.y_v2019.04"
SRC_URI = "${UBOOT_SRC};branch=${SRCBRANCH} \
           file://0001-SOMLABS-add-rotate-fbcon-argument-for-kernel.patch \
           "

SRCREV = "9228fa0f3f4cb858f495f06f18c33ae6efd459dd"

