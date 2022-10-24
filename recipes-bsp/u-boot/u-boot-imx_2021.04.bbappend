FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

UBOOT_SRC = "git://github.com/SoMLabs/somlabs-uboot-imx.git;protocol=https"
SRCBRANCH = "somlabs-imx_v2021.04_5.10.72-2.2.0"
SRC_URI = "${UBOOT_SRC};branch=${SRCBRANCH} \
           file://splash.bmp \
           "

SRCREV = "5074b6b0fe54164fee4a388e07a57428a882c774"

do_install_append_visioncb-6ull-std() {
        install -d ${DEPLOY_DIR_IMAGE}
        install -m 0644 ${WORKDIR}/splash.bmp ${DEPLOY_DIR_IMAGE}/splash.bmp
}

do_install_append_starsom-cb-6ull() {
        install -d ${DEPLOY_DIR_IMAGE}
        install -m 0644 ${WORKDIR}/splash.bmp ${DEPLOY_DIR_IMAGE}/splash.bmp
}
