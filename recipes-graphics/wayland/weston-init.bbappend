FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
            file://weston.ini \
            file://somlabs_desktop.png \
            "
FILES_${PN} += " /usr/share/weston "

do_install_append() {
    install -d ${D}${sysconfdir}/xdg/weston
    install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston

    install -d ${D}/usr/share/weston
    install -m 0644 ${WORKDIR}/somlabs_desktop.png ${D}/usr/share/weston/somlabs_desktop.png
}

