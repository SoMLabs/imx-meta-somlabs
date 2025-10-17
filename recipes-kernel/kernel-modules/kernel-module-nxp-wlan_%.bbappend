LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=ab04ac0f249af12befccb94447c08b77"

SRCBRANCH = "lf-6.12.34_2.1.0"
MRVL_SRC = "git://github.com/nxp-imx/mwifiex.git;protocol=https"
SRC_URI = "${MRVL_SRC};branch=${SRCBRANCH}"
SRCREV = "1e1f69bf38369807443e8f567cac63e26fe80881"

S = "${WORKDIR}/git"

KERNEL_MODULE_AUTOLOAD += "moal"
KERNEL_MODULE_PROBECONF += "moal"
module_conf_moal = "options moal mod_para=nxp/wifi_mod_para.conf"
