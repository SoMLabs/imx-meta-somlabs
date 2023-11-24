FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

ATF_SRC = "git://github.com/SoMLabs/somlabs-imx-atf.git;protocol=https"
SRCBRANCH = "somlabs_imx_v2.8_6.1.36-2.1.0"
SRC_URI = "${ATF_SRC};branch=${SRCBRANCH}"

SRCREV = "c659de1639cf02d651bef0406e49e58d6c797ae4"

ATF_BOOT_UART_BASE = "0x30a60000"

