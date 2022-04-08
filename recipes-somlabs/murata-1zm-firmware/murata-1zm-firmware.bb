SUMMARY = "Wi-Fi firmware for 1ZM module provided by Murata"
DESCRIPTION = "Required firmware to be used with the Murata 1ZM wireless module. \
               The receipe configures it for EU region."

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"

SRC_URI = "git://github.com/murata-wireless/nxp-linux-calibration.git;protocol=https"
SRCREV = "8df44e8dfa0db3310b9f0701f060361015b3d24d"
SRC_URI[sha256sum] = "d97831abf0a570b8a793829af5e260f0d83f4fc6e847ce1e0078564f117867cc"

S = "${WORKDIR}/git"

RDEPENDS_${PN} = "libgcrypt libnl libnl-genl"

COUNTRY = "EU"

do_install() {
    install -d ${D}/${sbindir}
    install -m 0755 ${S}/murata/files/64_bit/crda ${D}/${sbindir}
    install -m 0755 ${S}/murata/files/64_bit/regdbdump ${D}/${sbindir}

    install -d ${D}/${libdir}
    install -m 0644 ${S}/murata/files/64_bit/libreg.so ${D}/${libdir}

    install -d ${D}/${libdir}/crda
    install -m 0644 ${S}/murata/files/1ZM/regulatory.bin ${D}/${libdir}/crda

    install -d ${D}/etc/udev/rules.d
    install -m 0644 ${S}/murata/files/regulatory.rules ${D}/etc/udev/rules.d

    install -d ${D}/lib/firmware/nxp
    install -m 0644 ${S}/murata/files/1ZM/txpower_${COUNTRY}.bin ${D}/lib/firmware/nxp
    install -m 0644 ${S}/murata/files/1ZM/ed_mac.bin ${D}/lib/firmware/nxp
    install -m 0755 ${S}/murata/files/bt_power_config_1.sh ${D}/lib/firmware/nxp
    install -m 0755 ${S}/murata/files/wifi_mod_para_murata.conf ${D}/lib/firmware/nxp/wifi_mod_para.conf

    sed -i '83s/txpower_US/txpower_EU/' ${D}/lib/firmware/nxp/wifi_mod_para.conf
    sed -i '84 i muratainit_hostcmd_cfg=nxp/ed_mac.bin' ${D}/lib/firmware/nxp/wifi_mod_para.conf
    sed -i 's/murata/	/g' ${D}/lib/firmware/nxp/wifi_mod_para.conf
}

FILES_${PN} = "\
    ${sbindir}/crda \
    ${sbindir}/regdbdump \
    ${libdir}/libreg.so \
    ${libdir}/crda/regulatory.bin \
    /etc/udev/rules.d/regulatory.rules \
    /lib/firmware/nxp/txpower_${COUNTRY}.bin \
    /lib/firmware/nxp/ed_mac.bin \
    /lib/firmware/nxp/bt_power_config_1.sh \
    /lib/firmware/nxp/wifi_mod_para.conf \
"

SOLIBS = ".so"
FILES_SOLIBSDEV = ""
