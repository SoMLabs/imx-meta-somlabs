FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

KERNEL_SRC = "git://github.com/SoMLabs/somlabs-linux-imx.git;protocol=http"
SRC_URI = "${KERNEL_SRC};branch=${KERNEL_BRANCH}"

KERNEL_BRANCH = "somlabs_imx_5.10.52_2.1.0"
SRCREV = "7f682789ddb8d9eb190fa9d0f051ea61eb1a5f46"

IMX_KERNEL_CONFIG_AARCH64_visionsom-8mm-cb = "visionsom_8mm_defconfig"
IMX_KERNEL_CONFIG_AARCH64_visionsbc-8mmini = "visionsom_8mm_defconfig"
IMX_KERNEL_CONFIG_AARCH32_visioncb-6ull-std = "visionsom_6ull_defconfig"

# Remove the kernel-image dependency to not install additional kernel packages
RDEPENDS_${KERNEL_PACKAGE_NAME}-base = ""
