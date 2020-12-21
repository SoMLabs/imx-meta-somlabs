# Provides the VisionCB-6ULL-STD common settings

MACHINEOVERRIDES =. "mx6:mx6ul:mx6ull:"
IMX_DEFAULT_BSP = "nxp"

include conf/machine/include/imx-base.inc
include conf/machine/include/tune-cortexa7.inc

UBOOT_CONFIG ??= "sd"
UBOOT_CONFIG[sd] = "visionsom_6ull_defconfig,sdcard"

UBOOT_DTB_NAME = "imx6ull-visionsom.dtb"

PREFERRED_VERSION_u-boot-imx = "2019.04"

IMAGE_BOOT_FILES = " \
	${KERNEL_IMAGETYPE} \
	${@make_dtb_boot_files(d)} \
	splash.bmp \
"

SERIAL_CONSOLES = "115200;ttymxc0"

