do_install_append () {

    install -d ${D}${nonarch_base_libdir}/firmware/brcm/
    install -m 0644 ${WORKDIR}/imx-firmware/cyw-wifi-bt/1DX_CYW43430/BCM43430A1.1DX.hcd ${D}${nonarch_base_libdir}/firmware/brcm/BCM43430A1.hcd

}

FILES_${PN}-bcm43430 += " \
       ${nonarch_base_libdir}/firmware/brcm/BCM43430A1.hcd \
"
