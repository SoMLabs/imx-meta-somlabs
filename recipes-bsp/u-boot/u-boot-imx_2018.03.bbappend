FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

UBOOT_SRC = "git://github.com/SoMLabs/somlabs-uboot-imx.git;protocol=https"
SRCBRANCH = "somlabs-imx_v2018.03_4.14.98_2.0.0_ga"
SRC_URI = "${UBOOT_SRC};branch=${SRCBRANCH} \
           file://splash.bmp \
           file://0001-Load-the-kernel-and-dtb-from-fat-partition.patch \
           file://0002-Disable-the-display-before-transition-to-kernel.patch \
          "
SRCREV = "dbe68c464c301ddcd83ca4c09d7bf93baf85ed5e"

do_compile_prepend() {
	sed -i "s/setfdtfile=setenv fdt_file somlabs-\${board}\${fdt_suffix}.dtb/setfdtfile=setenv fdt_file ${KERNEL_DEVICETREE}/g" ${S}/include/configs/somlabs_visionsom_6ull.h
}

do_install_append() {
	install -d ${DEPLOY_DIR_IMAGE}
	install -m 0644 ${WORKDIR}/splash.bmp ${DEPLOY_DIR_IMAGE}/splash.bmp
}
