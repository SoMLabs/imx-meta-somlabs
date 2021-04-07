FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

UBOOT_SRC = "git://github.com/SoMLabs/somlabs-uboot-imx.git;protocol=https"
SRCBRANCH = "somlabs-imx_v2020.04_5.4.47_2.2.0"
SRC_URI = "${UBOOT_SRC};branch=${SRCBRANCH} \
           file://splash.bmp \
           "

SRCREV = "92af50e418abb281518684b3be893e0d2859b197"

do_install_append_visioncb-6ull-std() {
        install -d ${DEPLOY_DIR_IMAGE}
        install -m 0644 ${WORKDIR}/splash.bmp ${DEPLOY_DIR_IMAGE}/splash.bmp
}

