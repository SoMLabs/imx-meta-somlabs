FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
            file://weston_8m.ini \
            file://weston_8m_rotated.ini \
            file://weston_6ull.ini \
            file://somlabs_desktop.png \
            file://somlabs-weston-init.service \
            file://somlabs-weston-init.sh \
            "

SYSTEMD_SERVICE:${PN}:append:visionsom-8mm-cb = " somlabs-weston-init.service "

do_install:append() {
    install -d ${D}/usr/share/weston
    install -m 0644 ${WORKDIR}/somlabs_desktop.png ${D}/usr/share/weston/somlabs_desktop.png
}

do_install:append:visionsom-8mm-cb() {
    install -m 0644 ${WORKDIR}/weston_8m.ini ${D}${sysconfdir}/xdg/weston/
    install -m 0644 ${WORKDIR}/weston_8m_rotated.ini ${D}${sysconfdir}/xdg/weston/

    install -d ${D}/${systemd_unitdir}/system
    install -m 0644 ${WORKDIR}/somlabs-weston-init.service ${D}/${systemd_unitdir}/system/

    install -d ${D}/usr/bin
    install -m 0755 ${WORKDIR}/somlabs-weston-init.sh ${D}/usr/bin/

    rm -f ${D}${sysconfdir}/xdg/weston/weston.ini
}

do_install:append:titansbc-8mmini() {
    install -m 0644 ${WORKDIR}/weston_8m.ini ${D}${sysconfdir}/xdg/weston/weston.ini
}

do_install:append:spacesom-8mplus-cb() {
    install -m 0644 ${WORKDIR}/weston_8m.ini ${D}${sysconfdir}/xdg/weston/weston.ini
}

do_install:append:visioncb-6ull-std() {
    install -m 0644 ${WORKDIR}/weston_6ull.ini ${D}${sysconfdir}/xdg/weston/weston.ini
}

do_install:append:starsom-cb-6ull() {
    install -m 0644 ${WORKDIR}/weston_6ull.ini ${D}${sysconfdir}/xdg/weston/weston.ini
}

FILES:${PN}:append = " /usr/share/weston "
