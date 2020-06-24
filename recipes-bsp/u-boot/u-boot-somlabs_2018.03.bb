# Copyright (C) 2018 SoMLabs

#FILESEXTRAPATHS_append = "${THISDIR}/${PN}:"

DESCRIPTION = "i.MX U-Boot suppporting SoMLabs boards."
require u-boot.inc
inherit pythonnative

PROVIDES += "u-boot"
DEPENDS_append = "dtc-native"

LICENSE = "GPLv2+"
LIC_FILES_CHKSUM = "file://Licenses/gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"

SRCBRANCH = "somlabs-imx_v2018.03_4.14.98_2.0.0_ga"
SRC_URI = "git://github.com/SoMLabs/somlabs-uboot-imx.git;branch=${SRCBRANCH};protocol=https"
SRCREV = "somlabs-visionsom-6ull-rel_3.0.4"
SRC_URI[sha256sum] = "aca41ce259f2307ec1528f2016cbabfc88d49f26ce6f8e851e5bf7c802d8bc92"

S = "${WORKDIR}/git"

inherit fsl-u-boot-localversion

LOCALVERSION ?= "-${SRCBRANCH}"

PACKAGE_ARCH = "${MACHINE_ARCH}"
COMPATIBLE_MACHINE = "(mx6|mx7)"

UBOOT_NAME_mx6 = "u-boot-${MACHINE}.bin-${UBOOT_CONFIG}"
UBOOT_NAME_mx7 = "u-boot-${MACHINE}.bin-${UBOOT_CONFIG}"

SRC_URI += "file://splash.bmp" 

do_install_append() {
	install -d ${DEPLOY_DIR_IMAGE}
	install -m 0644 ${WORKDIR}/splash.bmp ${DEPLOY_DIR_IMAGE}/splash.bmp
}
