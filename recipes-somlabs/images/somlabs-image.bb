DESCRIPTION = "This is the basic image for SoMLabs boards and modules"

inherit core-image extrausers

IMAGE_FEATURES:append = " \
    debug-tweaks \
    tools-sdk \
    tools-debug \
    ssh-server-dropbear \
    hwcodecs \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'weston', '', d)} \
"

IMAGE_INSTALL:append = " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'weston-xwayland xterm', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'packagegroup-fsl-gstreamer1.0-full', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'somlabs-demo', '', d)} \
    firmwared \
    can-utils \
    packagegroup-core-full-cmdline \
    packagegroup-fsl-tools-testapps \
    udev-rules-somlabs \
"

EXTRA_USERS_PARAMS = " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', \
                         'groupadd led; usermod -a -G led weston;', '', d)} \
"

