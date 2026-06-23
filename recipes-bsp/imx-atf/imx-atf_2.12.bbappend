FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

ATF_SRC = "git://github.com/SoMLabs/somlabs-imx-atf.git;protocol=https"

SRCBRANCH = "somlabs_imx_v2.12_6.12.34-2.1.0"
SRC_URI = "${ATF_SRC};branch=${SRCBRANCH}"

SRCREV = "8a2d9c056f37bc607463f2fcde6f473f5043b288"

PV = "2.12"
