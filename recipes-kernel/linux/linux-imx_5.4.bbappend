FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

KERNEL_SRC = "git://github.com/SoMLabs/somlabs-linux-imx.git;protocol=http"
SRC_URI = "${KERNEL_SRC};branch=${KERNEL_BRANCH} \
           "

KERNEL_BRANCH = "somlabs_imx_5.4.47_2.2.0"
SRCREV = "4345a5668785b7273f40f2b9a2b542a9549c800c"

addtask copy_somlabs_defconfig after do_patch do_copy_defconfig before do_preconfigure
do_copy_somlabs_defconfig () {
}

do_copy_somlabs_defconfig_append_visionsom-8mm-cb () {
    cp ${S}/arch/arm64/configs/visionsom_8mm_defconfig ${B}/.config
    cp ${S}/arch/arm64/configs/visionsom_8mm_defconfig ${B}/../defconfig
}

do_copy_somlabs_defconfig_append_visionsbc-8mmini () {
    cp ${S}/arch/arm64/configs/visionsom_8mm_defconfig ${B}/.config
    cp ${S}/arch/arm64/configs/visionsom_8mm_defconfig ${B}/../defconfig
}

do_copy_somlabs_defconfig_append_visioncb-6ull-std () {
    cp ${S}/arch/arm/configs/visionsom_6ull_defconfig ${B}/.config
    cp ${S}/arch/arm/configs/visionsom_6ull_defconfig ${B}/../defconfig
}

