FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

ATF_SRC = "git://github.com/SoMLabs/somlabs-imx-atf.git;protocol=https"
SRCBRANCH = "somlabs_imx_v2.6_6.1.1-1.0.0"
SRC_URI = "${ATF_SRC};branch=${SRCBRANCH}"

SRCREV = "cbb569ed6520a5cf27efa77e65373a8ca2792928"

ATF_BOOT_UART_BASE = "0x30a60000"
