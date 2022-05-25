FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
            file://weston_8mm.ini \
            file://weston_6ull.ini \
            file://somlabs_desktop.png \
            "
FILES:${PN} += " /usr/share/weston "

do_install:append() {
    install -d ${D}${sysconfdir}/xdg/weston

    install -d ${D}/usr/share/weston
    install -m 0644 ${WORKDIR}/somlabs_desktop.png ${D}/usr/share/weston/somlabs_desktop.png
}

do_install:append:visionsom-8mm-cb() {
    install -m 0644 ${WORKDIR}/weston_8mm.ini ${D}${sysconfdir}/xdg/weston/weston.ini
}

do_install:append:visionsbc-8mmini() {
    install -m 0644 ${WORKDIR}/weston_8mm.ini ${D}${sysconfdir}/xdg/weston/weston.ini
}

do_install:append:spacesom-8mplus-cb() {
    install -m 0644 ${WORKDIR}/weston_8mm.ini ${D}${sysconfdir}/xdg/weston/weston.ini
}

do_install:append:visioncb-6ull-std() {
    install -m 0644 ${WORKDIR}/weston_6ull.ini ${D}${sysconfdir}/xdg/weston/weston.ini
}

do_install:append:starsom-cb-6ull() {
    install -m 0644 ${WORKDIR}/weston_6ull.ini ${D}${sysconfdir}/xdg/weston/weston.ini
}
