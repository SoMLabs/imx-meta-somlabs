SUMMARY = "Wi-Fi firmware for 1ZM module provided by Murata and NXP"
DESCRIPTION = "Required firmware to be used with the Murata 1ZM wireless module. \
               The receipe configures it for EU region."

LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://cal/LICENSE;md5=ffa10f40b98be2c2bc9608f56827ed23"

SRC_URI = " \
  git://github.com/murata-wireless/nxp-linux-calibration.git;protocol=https;branch=imx-6-1-1;name=cal;destsuffix=cal \
  git://github.com/NXP/imx-firmware.git;protocol=https;branch=lf-6.1.36_2.1.0;name=fw;destsuffix=fw"

SRCREV_cal = "f4cce135cd5f3ee8ebea3db7ff15209d13fec411"
SRCREV_fw = "1fb80d0266e8044fb7eea695c7678cddcbbc77c5"

SRCREV_FORMAT = "cal_fw"

SRC_URI[sha256sum] = "d97831abf0a570b8a793829af5e260f0d83f4fc6e847ce1e0078564f117867cc"

S = "${WORKDIR}"

COUNTRY = "EU"

do_install() {
    install -d ${D}${nonarch_base_libdir}/firmware/nxp
    install -m 0644 ${S}/cal/murata/files/1ZM/txpower_${COUNTRY}.bin ${D}${nonarch_base_libdir}/firmware/nxp
    install -m 0755 ${S}/cal/murata/files/wifi_mod_para_murata.conf ${D}${nonarch_base_libdir}/firmware/nxp/wifi_mod_para.conf
    install -m 0755 ${S}/fw/nxp/FwImage_8987/sdiouart8987_combo_v0.bin ${D}${nonarch_base_libdir}/firmware/nxp

    sed -i '81s/txpower_US/txpower_EU/' ${D}${nonarch_base_libdir}/firmware/nxp/wifi_mod_para.conf
    sed -i 's/murata/	/g' ${D}${nonarch_base_libdir}/firmware/nxp/wifi_mod_para.conf
}

FILES:${PN} = "\
    ${nonarch_base_libdir}/firmware/nxp/txpower_${COUNTRY}.bin \
    ${nonarch_base_libdir}/firmware/nxp/wifi_mod_para.conf \
    ${nonarch_base_libdir}/firmware/nxp/sdiouart8987_combo_v0.bin \
"

