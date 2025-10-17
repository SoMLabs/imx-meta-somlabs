FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

UBOOT_SRC = "git://github.com/SoMLabs/somlabs-uboot-imx.git;protocol=https"

SRCBRANCH = "somlabs-imx_v2024.04_6.6.52-2.2.0"
SRC_URI = "${UBOOT_SRC};branch=${SRCBRANCH} \
           file://splash.bmp \
           "

LOCALVERSION="-somlabs-imx_v2024.04_6.6.52-2.2.0"

SRCREV = "8889212ddd82ccf952e8e79adcfdc68aade8cf46"

do_install:append:visioncb-6ull-std() {
        install -d ${DEPLOY_DIR_IMAGE}
        install -m 0644 ${UNPACKDIR}/splash.bmp ${DEPLOY_DIR_IMAGE}/splash.bmp
}

do_install:append:starsom-cb-6ull() {
        install -d ${DEPLOY_DIR_IMAGE}
        install -m 0644 ${UNPACKDIR}/splash.bmp ${DEPLOY_DIR_IMAGE}/splash.bmp
}
