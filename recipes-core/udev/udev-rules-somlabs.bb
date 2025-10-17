DESCRIPTION = "udev rules for SoMLabs boards and modules"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = " file://20-dmaheap.rules \
            file://20-led.rules \
            file://20-hantro.rules \
            file://20-pxp.rules \
"

S = "${WORKDIR}/src"
UNPACKDIR = "${S}"

do_install() {
        install -d ${D}${sysconfdir}/udev/rules.d
        install -m 0644 ${S}/20-dmaheap.rules ${D}${sysconfdir}/udev/rules.d/
        install -m 0644 ${S}/20-led.rules ${D}${sysconfdir}/udev/rules.d/
}

do_install:append:visionsom-8mm-cb() {
        install -m 0644 ${S}/20-hantro.rules ${D}${sysconfdir}/udev/rules.d/
}

do_install:append:titansbc-8mmini() {
        install -m 0644 ${S}/20-hantro.rules ${D}${sysconfdir}/udev/rules.d/
}

do_install:append:visionsom-imx93() {
        install -m 0644 ${S}/20-pxp.rules ${D}${sysconfdir}/udev/rules.d/
}
