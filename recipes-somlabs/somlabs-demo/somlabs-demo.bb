DESCRIPTION = "SoMLabs demo application"
LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"

inherit pkgconfig

DEPENDS += "wayland"
DEPENDS += "gtk+3"
DEPENDS += "gstreamer1.0"
DEPENDS += "gstreamer1.0-plugins-base"
DEPENDS += "gstreamer1.0-plugins-bad"
DEPENDS += "gstreamer1.0-libav"
DEPENDS += "glib-2.0"

SRC_URI = " \
    file://somlabs_demo_gui_launch_8mm.sh \
    file://somlabs_demo_gui_launch_6ull.sh \
    file://main_gui.c \
    file://background_8mmini.jpg \
    file://background_sbc_8mmini.jpg \
    file://background_6ull.jpg \
    file://gui_test_1280_720.glade \
    file://gui_test_1280_720_no_led.glade \
    file://gui_test_800_480.glade \
    file://somlabs.png \
    file://theme.css \
    "

EXAMPLE_VIDEO_URL = "http://ftp.somlabs.com/misc/example_video.mp4"

S = "${WORKDIR}"

do_compile() {
    ${CC} ${CFLAGS} ${LDFLAGS} main_gui.c -o somlabs_demo_gui `pkg-config --cflags --libs gtk+-3.0 gstreamer-1.0 gstreamer-video-1.0 gstreamer-plugins-base-1.0 gstreamer-plugins-bad-1.0 glib-2.0` -rdynamic -I=/usr/lib/gstreamer-1.0/include -lgstwayland-1.0 -L=/usr/lib/gstreamer-1.0/ -lgstwaylandsink
}


do_install() {
    install -d ${D}/usr/share/somlabs-demo/
    install -m 0755 somlabs_demo_gui ${D}/usr/share/somlabs-demo/
    install -m 0755 somlabs.png ${D}/usr/share/somlabs-demo/
    install -m 0755 theme.css ${D}/usr/share/somlabs-demo/
    wget ${EXAMPLE_VIDEO_URL} -O ${D}/usr/share/somlabs-demo/example_video.mp4
}

do_install_append_visionsom-8mm-cb() {
    install -m 0755 background_8mmini.jpg ${D}/usr/share/somlabs-demo/background.jpg
    install -m 0755 gui_test_1280_720.glade ${D}/usr/share/somlabs-demo/gui_test.glade
    install -m 0755 somlabs_demo_gui_launch_8mm.sh ${D}/usr/share/somlabs-demo/somlabs_demo_gui_launch.sh
}

do_install_append_visionsbc-8mmini() {
    install -m 0755 background_sbc_8mmini.jpg ${D}/usr/share/somlabs-demo/background.jpg
    install -m 0755 gui_test_1280_720_no_led.glade ${D}/usr/share/somlabs-demo/gui_test.glade
    install -m 0755 somlabs_demo_gui_launch_8mm.sh ${D}/usr/share/somlabs-demo/somlabs_demo_gui_launch.sh
}

do_install_append_visioncb-6ull-std() {
    install -m 0755 background_6ull.jpg ${D}/usr/share/somlabs-demo/background.jpg
    install -m 0755 gui_test_800_480.glade ${D}/usr/share/somlabs-demo/gui_test.glade
    install -m 0755 somlabs_demo_gui_launch_6ull.sh ${D}/usr/share/somlabs-demo/somlabs_demo_gui_launch.sh
}

do_install_append_starsom-cb-6ull() {
    install -m 0755 background_6ull.jpg ${D}/usr/share/somlabs-demo/background.jpg
    install -m 0755 gui_test_800_480.glade ${D}/usr/share/somlabs-demo/gui_test.glade
    install -m 0755 somlabs_demo_gui_launch_6ull.sh ${D}/usr/share/somlabs-demo/somlabs_demo_gui_launch.sh
}

do_install_append_spacesom-8mplus-cb() {
    install -m 0755 background_8mmini.jpg ${D}/usr/share/somlabs-demo/background.jpg
    install -m 0755 gui_test_1280_720.glade ${D}/usr/share/somlabs-demo/gui_test.glade
    install -m 0755 somlabs_demo_gui_launch_8mm.sh ${D}/usr/share/somlabs-demo/somlabs_demo_gui_launch.sh
}

FILES_${PN} = " /usr/share/somlabs-demo/ "
