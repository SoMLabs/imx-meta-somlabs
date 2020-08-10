FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

UBOOT_SRC = "git://github.com/SoMLabs/somlabs-uboot-imx.git;protocol=https"
SRCBRANCH = "somlabs-lf-5.4.y_v2019.04"
SRC_URI = "${UBOOT_SRC};branch=${SRCBRANCH} \
           file://0001-SOMLABS-add-rotate-fbcon-argument-for-kernel.patch \
           file://visionsom_8mm_defconfig \
           "

SRCREV = "27069f286cd5db0119b9f8653781f3b20a843be6"

do_compile_prepend_visionsom-8mm-cb () {
        install -m 0644 ${WORKDIR}/visionsom_8mm_defconfig ${S}/configs
}

