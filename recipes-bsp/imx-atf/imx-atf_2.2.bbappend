FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

ATF_SRC = "git://github.com/SoMLabs/somlabs-imx-atf.git;protocol=https"
SRCBRANCH = "somlabs-imx-atf_5.4.47_2.2.0"
SRC_URI = "${ATF_SRC};branch=${SRCBRANCH}"

SRCREV = "dd89cefe9fad806c1255067fcdea25f14cc6d00e"

