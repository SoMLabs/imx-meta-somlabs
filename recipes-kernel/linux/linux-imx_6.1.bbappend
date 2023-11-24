FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

require recipes-kernel/linux/linux-imx-somlabs-src.inc

KBUILD_DEFCONFIG:visionsom-8mm-cb = "somlabs_8m_defconfig"
KBUILD_DEFCONFIG:visionsbc-8mmini = "somlabs_8m_defconfig"
KBUILD_DEFCONFIG:spacesom-8mplus-cb = "somlabs_8m_defconfig"
KBUILD_DEFCONFIG:visioncb-6ull-std = "somlabs_6ull_defconfig"
KBUILD_DEFCONFIG:starsom-cb-6ull = "somlabs_6ull_defconfig"
KBUILD_DEFCONFIG:starsbc-6ull = "somlabs_6ull_defconfig"

# Required for meta-imx compatibility
IMX_KERNEL_CONFIG_AARCH32 = "${KBUILD_DEFCONFIG}"
IMX_KERNEL_CONFIG_AARCH64 = "${KBUILD_DEFCONFIG}"

# Remove the kernel-image dependency to not install additional kernel packages
RDEPENDS:${KERNEL_PACKAGE_NAME}-base = ""
