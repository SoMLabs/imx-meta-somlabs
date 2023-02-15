FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

KERNEL_SRC = "git://github.com/SoMLabs/somlabs-linux-imx.git;protocol=http"
SRC_URI = "${KERNEL_SRC};branch=${KERNEL_BRANCH}"

KERNEL_BRANCH = "somlabs_imx_5.15.5-1.0.0"
SRCREV = "6a3c14fe6af67bf17be5b105a943a140e3aba42c"

IMX_KERNEL_CONFIG_AARCH64:visionsom-8mm-cb = "somlabs_8m_defconfig"
IMX_KERNEL_CONFIG_AARCH64:visionsbc-8mmini = "somlabs_8m_defconfig"
IMX_KERNEL_CONFIG_AARCH64:spacesom-8mplus-cb = "somlabs_8m_defconfig"
IMX_KERNEL_CONFIG_AARCH32:visioncb-6ull-std = "somlabs_6ull_defconfig"
IMX_KERNEL_CONFIG_AARCH32:starsom-cb-6ull = "somlabs_6ull_defconfig"
IMX_KERNEL_CONFIG_AARCH32:starsbc-6ull = "somlabs_6ull_defconfig"

# Remove the kernel-image dependency to not install additional kernel packages
RDEPENDS:${KERNEL_PACKAGE_NAME}-base = ""
