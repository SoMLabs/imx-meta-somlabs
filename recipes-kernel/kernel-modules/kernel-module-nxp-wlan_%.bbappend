SRCBRANCH = "lf-6.1.36_2.1.0"
MRVL_SRC = "git://github.com/nxp-imx/mwifiex.git;protocol=https"
SRC_URI = "${MRVL_SRC};branch=${SRCBRANCH}"
SRCREV = "26246bf60afa613272156fa268e4ff99f5d810ae"

KERNEL_MODULE_AUTOLOAD += "moal"
KERNEL_MODULE_PROBECONF += "moal"
module_conf_moal = "options moal mod_para=nxp/wifi_mod_para.conf"
