FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

ATF_SRC = "git://github.com/SoMLabs/somlabs-imx-atf.git;protocol=https"

SRCBRANCH = "somlabs_imx_v2.12_6.12.34-2.1.0"
SRC_URI = "${ATF_SRC};branch=${SRCBRANCH}"

SRCREV = "1c1e42b58999080176e7f1077035d4b010a51581"

PV = "2.10"
