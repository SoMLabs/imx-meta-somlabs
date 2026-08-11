FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

UBOOT_SRC = "git://github.com/SoMLabs/somlabs-uboot-imx.git;protocol=https"

SRCBRANCH = "somlabs-imx_v2025.04_6.18.20-2.0.0"
SRC_URI = "${UBOOT_SRC};branch=${SRCBRANCH} \
           file://splash.bmp \
           "

LOCALVERSION = "-somlabs-imx_v2025.04_6.18.20-2.0.0"

SRCREV = "de562c237bc31058c25dccfa14e4009df08a6b76"

do_install:append:visioncb-6ull-std() {
        install -d ${DEPLOY_DIR_IMAGE}
        install -m 0644 ${UNPACKDIR}/splash.bmp ${DEPLOY_DIR_IMAGE}/splash.bmp
}

do_install:append:starsom-cb-6ull() {
        install -d ${DEPLOY_DIR_IMAGE}
        install -m 0644 ${UNPACKDIR}/splash.bmp ${DEPLOY_DIR_IMAGE}/splash.bmp
}
