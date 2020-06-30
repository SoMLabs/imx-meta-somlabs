# Provides the VisionCB-6ULL-STD common settings

MACHINEOVERRIDES =. "mx6:mx6ul:mx6ull:"
IMX_DEFAULT_BSP = "nxp"

include conf/machine/include/imx-base.inc
include conf/machine/include/tune-cortexa7.inc

UBOOT_CONFIG ??= "sd"
UBOOT_CONFIG[sd] = "somlabs_visionsom_6ull_defconfig"

PREFERRED_PROVIDER_u-boot_visioncb-6ull-std = "u-boot-somlabs"
PREFERRED_PROVIDER_virtual/bootloader_visioncb-6ull-std = "u-boot-somlabs"

EXTRA_IMAGEDEPENDS += "u-boot-somlabs"

IMAGE_BOOT_FILES = " \
	${KERNEL_IMAGETYPE} \
	${@make_dtb_boot_files(d)} \
	splash.bmp \
"

SERIAL_CONSOLES = "115200;ttymxc0"

