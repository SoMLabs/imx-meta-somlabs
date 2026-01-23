FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
            file://weston_8m.ini \
            file://weston_6ull.ini \
            file://weston_imx93.ini \
            file://somlabs_desktop.png \
            "

do_install:append() {
    install -d ${D}/usr/share/weston
    install -m 0644 ${S}/somlabs_desktop.png ${D}/usr/share/weston/somlabs_desktop.png
}

do_install:append:visionsom-8mm-cb() {
    install -m 0644 ${S}/weston_8m.ini ${D}${sysconfdir}/xdg/weston/weston.ini
}

do_install:append:titansbc-8mmini() {
    install -m 0644 ${S}/weston_8m.ini ${D}${sysconfdir}/xdg/weston/weston.ini
}

do_install:append:spacesom-8mplus-cb() {
    install -m 0644 ${S}/weston_8m.ini ${D}${sysconfdir}/xdg/weston/weston.ini
}

do_install:append:somlabs-aiot-box-8mplus() {
    install -m 0644 ${S}/weston_8m.ini ${D}${sysconfdir}/xdg/weston/weston.ini
}

do_install:append:visioncb-6ull-std() {
    install -m 0644 ${S}/weston_6ull.ini ${D}${sysconfdir}/xdg/weston/weston.ini
}

do_install:append:starsom-cb-6ull() {
    install -m 0644 ${S}/weston_6ull.ini ${D}${sysconfdir}/xdg/weston/weston.ini
}

do_install:append:visionsom-imx93() {
    install -m 0644 ${S}/weston_imx93.ini ${D}${sysconfdir}/xdg/weston/weston.ini
}

FILES:${PN}:append = " /usr/share/weston "
