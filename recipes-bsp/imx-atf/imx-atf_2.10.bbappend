FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

ATF_SRC = "git://github.com/SoMLabs/somlabs-imx-atf.git;protocol=https"

SRCBRANCH = "somlabs_imx_v2.10_6.6.52-2.2.0"
SRC_URI = "${ATF_SRC};branch=${SRCBRANCH}"

SRCREV = "f7d8191a7668fde20f7e4c653a72cc51c7d94c2f"

PV = "2.10"
