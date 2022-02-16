FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

ATF_SRC = "git://github.com/SoMLabs/somlabs-imx-atf.git;protocol=https"
SRCBRANCH = "somlabs-imx-atf_5.10.72_2.2.0"
SRC_URI = "${ATF_SRC};branch=${SRCBRANCH}"

SRCREV = "cdbbd84119e6b2c1b2d266675fe96d8f0da275c4"

