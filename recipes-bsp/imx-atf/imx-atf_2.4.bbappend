FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

ATF_SRC = "git://github.com/SoMLabs/somlabs-imx-atf.git;protocol=https"
SRCBRANCH = "somlabs-imx-atf_5.10.72_2.2.0"
SRC_URI = "${ATF_SRC};branch=${SRCBRANCH}"

SRCREV = "218e5d0c40c01c57ca6fe7f6c48a64bd2eb4ce95"

