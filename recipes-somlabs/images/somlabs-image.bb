DESCRIPTION = "This is the basic image with wayland/xwayland environment"

inherit core-image

IMAGE_FEATURES += " \
    debug-tweaks \
    tools-sdk \
    tools-debug \
    ssh-server-dropbear \
    hwcodecs \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'weston', \
       bb.utils.contains('DISTRO_FEATURES',     'x11', 'x11-base x11-sato', \
                                                       '', d), d)} \
"

IMAGE_INSTALL += " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'weston-xwayland xterm', '', d)} \
    firmwared \
    packagegroup-core-full-cmdline \
    packagegroup-imx-core-tools \
    packagegroup-imx-security \
    packagegroup-fsl-gstreamer1.0 \
    packagegroup-fsl-gstreamer1.0-full \
    somlabs-demo \
"
