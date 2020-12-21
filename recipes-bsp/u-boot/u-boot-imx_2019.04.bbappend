FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

UBOOT_SRC = "git://github.com/SoMLabs/somlabs-uboot-imx.git;protocol=https"
SRCBRANCH = "somlabs-lf-5.4.y_v2019.04"
SRC_URI = "${UBOOT_SRC};branch=${SRCBRANCH} \
           file://splash.bmp \
           "

SRCREV = "3d0c1acbcba88fd79c3d5c854593401510bcdb82"

do_compile_prepend_visioncb-6ull-std() {
        sed -i "s/setfdtfile=setenv fdt_file somlabs-\${board}\${fdt_suffix}.dtb/setfdtfile=setenv fdt_file ${KERNEL_DEVICETREE}/g" ${S}/include/configs/visionsom_6ull.h
}

do_install_append_visioncb-6ull-std() {
        install -d ${DEPLOY_DIR_IMAGE}
        install -m 0644 ${WORKDIR}/splash.bmp ${DEPLOY_DIR_IMAGE}/splash.bmp
}

