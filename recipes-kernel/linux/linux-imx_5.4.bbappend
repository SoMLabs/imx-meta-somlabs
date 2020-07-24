FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

LOCALVERSION = "-lts-${KERNEL_BRANCH}"
KERNEL_SRC = "git://github.com/SoMLabs/somlabs-linux-imx.git;protocol=http"
SRC_URI = "${KERNEL_SRC};branch=${KERNEL_BRANCH} \
           file://visionsom_8mm_defconfig \
           file://visionsom_6ull_defconfig \
           "

KERNEL_BRANCH = "somlabs_lf-5.4.y"
SRCREV = "7b33f1a768586ce5feed5819bc8e35def1894959"

IMX_KERNEL_CONFIG_AARCH32_visioncb-6ull-std = "visionsom_6ull_defconfig"
IMX_KERNEL_CONFIG_AARCH64_visionsom-8mm-cb = "visionsom_8mm_defconfig"

do_copy_defconfig_append_visionsom-8mm-cb () {
        cp ${WORKDIR}/visionsom_8mm_defconfig ${WORKDIR}/defconfig          
        cp ${WORKDIR}/visionsom_8mm_defconfig ${WORKDIR}/build/.config
}

do_copy_defconfig_append_visioncb-6ull-std () {
        cp ${WORKDIR}/visionsom_6ull_defconfig ${WORKDIR}/defconfig          
        cp ${WORKDIR}/visionsom_6ull_defconfig ${WORKDIR}/build/.config
}
