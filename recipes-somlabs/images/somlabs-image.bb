DESCRIPTION = "This is the basic image for SoMLabs boards and modules"

inherit core-image extrausers

IMAGE_FEATURES:append = " \
    allow-empty-password \
    allow-root-login \
    empty-root-password \
    post-install-logging \
    tools-sdk \
    tools-debug \
    ssh-server-dropbear \
    hwcodecs \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'weston', '', d)} \
"

IMAGE_INSTALL:append = " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', \
                         'weston-xwayland xterm v4l-utils', '', d)} \
    firmwared \
    can-utils \
    libgpiod-tools \
    packagegroup-core-full-cmdline \
    udev-rules-somlabs \
"

IMAGE_INSTALL:append:somlabs-aiot-box-8mplus = " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'packagegroup-fsl-gstreamer1.0-full', '', d)} \
"

IMAGE_INSTALL:append:spacesom-8mplus-cb = " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'packagegroup-fsl-gstreamer1.0-full', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'somlabs-demo', '', d)} \
"

IMAGE_INSTALL:append:starsom-8mp-cb = " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'packagegroup-fsl-gstreamer1.0-full', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'somlabs-demo', '', d)} \
"

IMAGE_INSTALL:append:titansbc-8mmini = " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'packagegroup-fsl-gstreamer1.0-full', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'somlabs-demo', '', d)} \
"

IMAGE_INSTALL:append:visionsom-8mm-cb = " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'packagegroup-fsl-gstreamer1.0-full', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'somlabs-demo', '', d)} \
"

IMAGE_INSTALL:append:visionsom-imx93 = " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'packagegroup-fsl-gstreamer1.0-full', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'somlabs-demo', '', d)} \
"

EXTRA_USERS_PARAMS = " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', \
                         'groupadd led; usermod -a -G led weston;', '', d)} \
"
