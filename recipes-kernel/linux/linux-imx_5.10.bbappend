FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

KERNEL_SRC = "git://github.com/SoMLabs/somlabs-linux-imx.git;protocol=http"
SRC_URI = "${KERNEL_SRC};branch=${KERNEL_BRANCH}"

KERNEL_BRANCH = "somlabs_imx_5.10.52_2.1.0"
SRCREV = "ca1817238b9717a0e094990085afd4eee38e1bd2"

IMX_KERNEL_CONFIG_AARCH64_visionsom-8mm-cb = "somlabs_8mm_defconfig"
IMX_KERNEL_CONFIG_AARCH64_visionsbc-8mmini = "somlabs_8mm_defconfig"
IMX_KERNEL_CONFIG_AARCH32_visioncb-6ull-std = "somlabs_6ull_defconfig"
IMX_KERNEL_CONFIG_AARCH32_starsom-cb-6ull = "somlabs_6ull_defconfig"
IMX_KERNEL_CONFIG_AARCH32_starsbc-6ull = "somlabs_6ull_defconfig"

# Remove the kernel-image dependency to not install additional kernel packages
RDEPENDS_${KERNEL_PACKAGE_NAME}-base = ""
