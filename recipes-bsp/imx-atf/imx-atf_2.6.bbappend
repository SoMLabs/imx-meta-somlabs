FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

ATF_SRC = "git://github.com/SoMLabs/somlabs-imx-atf.git;protocol=https"
SRCBRANCH = "somlabs_imx_v2.6_5.15.52-2.1.0"
SRC_URI = "${ATF_SRC};branch=${SRCBRANCH}"

SRCREV = "fef71fcacaed4249bcd8177138366993487d172d"

