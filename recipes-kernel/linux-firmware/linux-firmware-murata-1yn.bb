SUMMARY = "Wi-Fi firmware for 1YN module provided by Cypress"
DESCRIPTION = "Required firmware to be used with the Murata 1YN wireless module."

LICENSE = "firmware-cypress-fw & firmware-cypress-nvram & firmware-cypress-bt"
NO_GENERIC_LICENSE[firmware-cypress-bt] = "LICENCE.cypress_bt"
NO_GENERIC_LICENSE[firmware-cypress-fw] = "LICENCE.cypress_fw"
NO_GENERIC_LICENSE[firmware-cypress-nvram] = "LICENCE.cypress_nvram"

LIC_FILES_CHKSUM = " \
  file://LICENCE.cypress_bt;md5=cbc5f665d04f741f1e006d2096236ba7 \
  file://LICENCE.cypress_fw;md5=cbc5f665d04f741f1e006d2096236ba7 \
  file://LICENCE.cypress_nvram;md5=cbc5f665d04f741f1e006d2096236ba7 \
"

SRC_URI = " \
  git://github.com/murata-wireless/cyw-bt-patch.git;protocol=https;branch=master;name=bt;destsuffix=bt \
  git://github.com/murata-wireless/cyw-fmac-fw.git;protocol=https;branch=master;name=fw;destsuffix=fw \
  git://github.com/murata-wireless/cyw-fmac-nvram.git;protocol=https;branch=master;name=nvram;destsuffix=nvram \
"

SRCREV_fw = "50ac17bb65b2342cd954d49d9bc492709d431c3c"
SRCREV_nvram = "255819aab07572d87576a13329ef9d4c654167aa"
SRCREV_bt = "bbc63f8b15394023c4a2fd9f74565fbd0d76ae71"

SRCREV_FORMAT = "bt_fw_nvram"

S = "${WORKDIR}"

addtask copy_lic after do_patch before do_populate_lic

do_copy_lic() {
  cp ${WORKDIR}/bt/LICENCE.cypress ${B}/LICENCE.cypress_bt
  cp ${WORKDIR}/fw/LICENCE ${B}/LICENCE.cypress_fw
  cp ${WORKDIR}/nvram/LICENCE.cypress ${B}/LICENCE.cypress_nvram
}

do_install() {
    install -d ${D}${nonarch_base_libdir}/firmware/brcm
    install -m 0644 ${S}/bt/CYW4343A2_001.003.016.0031.0000.1YN.hcd ${D}${nonarch_base_libdir}/firmware/brcm/CYW4343A2.${BCM_FIRMWARE_SUFFIX}.hcd
    install -m 0644 ${S}/fw/cyfmac43439-sdio.bin ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43439-sdio.${BCM_FIRMWARE_SUFFIX}.bin
    install -m 0644 ${S}/fw/cyfmac43439-sdio.1YN.clm_blob ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43439-sdio.clm_blob
    install -m 0644 ${S}/nvram/cyfmac43439-sdio.1YN.txt ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43439-sdio.txt
}

FILES:${PN} = "${nonarch_base_libdir}/firmware/brcm"
