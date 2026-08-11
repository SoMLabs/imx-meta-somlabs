LIC_FILES_CHKSUM = "file://LICENSE;md5=ab04ac0f249af12befccb94447c08b77"

SRCBRANCH = "lf-6.18.20_2.0.0"
MRVL_SRC = "git://github.com/nxp-imx/mwifiex.git;protocol=https"
SRC_URI = "${MRVL_SRC};branch=${SRCBRANCH}"
SRCREV = "2e481212d262758cbd4d0fc7ea95a2ad5f704bc3"

S = "${UNPACKDIR}/${BP}"

KERNEL_MODULE_AUTOLOAD += "moal"
KERNEL_MODULE_PROBECONF += "moal"
module_conf_moal = "options moal mod_para=nxp/wifi_mod_para.conf"
