FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

ATF_SRC = "git://github.com/SoMLabs/somlabs-imx-atf.git;protocol=https"
SRCBRANCH = "somlabs-imx-atf_5.15.5_1.0.0"
SRC_URI = "${ATF_SRC};branch=${SRCBRANCH}"

SRCREV = "235f17cf3592ce876c197b8856b69bdd98313d0a"

