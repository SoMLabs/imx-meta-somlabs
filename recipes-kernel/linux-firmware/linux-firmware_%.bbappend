do_install:append () {

    install -d ${D}${nonarch_base_libdir}/firmware/brcm/
    install -m 0644 ${WORKDIR}/imx-firmware/cyw-wifi-bt/1DX_CYW43430/brcmfmac43430-sdio.clm_blob ${D}${nonarch_base_libdir}/firmware/brcm
    install -m 0644 ${WORKDIR}/imx-firmware/cyw-wifi-bt/1DX_CYW43430/brcmfmac43430-sdio.bin ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.${BCM_FIRMWARE_SUFFIX}.bin
    install -m 0644 ${WORKDIR}/imx-firmware/cyw-wifi-bt/1DX_CYW43430/brcmfmac43430-sdio.txt ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.${BCM_FIRMWARE_SUFFIX}.txt
    install -m 0644 ${WORKDIR}/imx-firmware/cyw-wifi-bt/1DX_CYW43430/BCM43430A1.1DX.hcd ${D}${nonarch_base_libdir}/firmware/brcm/BCM43430A1.hcd


}

FILES:${PN}-bcm43430 += " \
       ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.clm_blob \
       ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.${BCM_FIRMWARE_SUFFIX}.bin \
       ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.${BCM_FIRMWARE_SUFFIX}.txt \
       ${nonarch_base_libdir}/firmware/brcm/BCM43430A1.hcd \
"

