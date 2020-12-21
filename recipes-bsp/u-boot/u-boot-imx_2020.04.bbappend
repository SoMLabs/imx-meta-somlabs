FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

UBOOT_SRC = "git://github.com/SoMLabs/somlabs-uboot-imx.git;protocol=https"
SRCBRANCH = "somlabs-imx_v2020.04_5.4.24_2.1.0"
SRC_URI = "${UBOOT_SRC};branch=${SRCBRANCH} \
           file://splash.bmp \
           "

SRCREV = "3dfddc263686763772e6d3e8ba570df52407074b"

do_compile_prepend_visioncb-6ull-std() {
        sed -i "s/setfdtfile=setenv fdt_file somlabs-\${board}\${fdt_suffix}.dtb/setfdtfile=setenv fdt_file ${KERNEL_DEVICETREE}/g" ${S}/include/configs/visionsom_6ull.h
}

do_install_append_visioncb-6ull-std() {
        install -d ${DEPLOY_DIR_IMAGE}
        install -m 0644 ${WORKDIR}/splash.bmp ${DEPLOY_DIR_IMAGE}/splash.bmp
}

