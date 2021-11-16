FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

ATF_SRC = "git://github.com/SoMLabs/somlabs-imx-atf.git;protocol=https"
SRCBRANCH = "somlabs-imx-atf_5.10.52_2.1.0"
SRC_URI = "${ATF_SRC};branch=${SRCBRANCH}"

SRCREV = "6fb61b8000acef8727721ad41139b516a19ea6f8"

