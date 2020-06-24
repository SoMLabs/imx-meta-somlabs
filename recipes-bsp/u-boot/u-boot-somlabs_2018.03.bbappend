FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-Load-the-kernel-and-dtb-from-fat-partition.patch \
            file://0001-Disable-the-display-before-transition-to-kernel.patch \
            "
