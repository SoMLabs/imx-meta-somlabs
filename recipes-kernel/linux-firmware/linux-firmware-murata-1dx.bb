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
  git://github.com/murata-wireless/cyw-bt-patch.git;protocol=https;nobranch=1;name=bt;destsuffix=bt \
  git://github.com/murata-wireless/cyw-fmac-fw.git;protocol=https;nobranch=1;name=fw;destsuffix=fw \
  git://github.com/murata-wireless/cyw-fmac-nvram.git;protocol=https;nobranch=1;name=nvram;destsuffix=nvram \
"

SRCREV_bt = "9d24c254dae92af99ddfd661a4ea30af69190038"
SRCREV_fw = "716b63d941ebe56dcb528b482cb74d6aff119fd4"
SRCREV_nvram = "9b7d93eb3e13b2d2ed8ce3a01338ceb54151b77a"

SRCREV_FORMAT = "bt_fw_nvram"

do_install() {
  install -d ${D}${nonarch_base_libdir}/firmware/brcm
  install -m 0644 ${WORKDIR}/bt/BCM43430A1_001.002.009.0159.0528.1DX.hcd ${D}${nonarch_base_libdir}/firmware/brcm/BCM43430A1.hcd
  install -m 0644 ${WORKDIR}/bt/LICENCE.cypress ${D}${nonarch_base_libdir}/firmware/brcm/LICENCE.cypress_bt
  install -m 0644 ${WORKDIR}/nvram/cyfmac43430-sdio.1DX.txt ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt
  install -m 0644 ${WORKDIR}/nvram/LICENCE.cypress ${D}${nonarch_base_libdir}/firmware/brcm/LICENCE.cypress_nvram
  install -m 0644 ${WORKDIR}/nvram/cyfmac43430-sdio.1DX.txt ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.${BCM_FIRMWARE_SUFFIX}.txt
  install -m 0644 ${WORKDIR}/fw/cyfmac43430-sdio.bin ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.${BCM_FIRMWARE_SUFFIX}.bin
  install -m 0644 ${WORKDIR}/fw/cyfmac43430-sdio.1DX.clm_blob ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.clm_blob
  install -m 0644 ${WORKDIR}/fw/LICENCE ${D}${nonarch_base_libdir}/firmware/brcm/LICENCE.cypress_fw

}

addtask copy_lic after do_patch before do_populate_lic

do_copy_lic() {
  cp ${WORKDIR}/bt/LICENCE.cypress ${B}/LICENCE.cypress_bt
  cp ${WORKDIR}/fw/LICENCE ${B}/LICENCE.cypress_fw
  cp ${WORKDIR}/nvram/LICENCE.cypress ${B}/LICENCE.cypress_nvram
}

FILES:${PN} = " ${nonarch_base_libdir}/firmware/brcm/ "
