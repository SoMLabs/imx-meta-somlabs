# Provides the VisionSOM-8MM-CB common settings
 
MACHINEOVERRIDES =. "mx8:mx8m:mx8mm:"

require conf/machine/include/imx-base.inc
require conf/machine/include/tune-cortexa53.inc

MACHINE_FEATURES += " pci optee"

UBOOT_CONFIG ??= "sd"
UBOOT_CONFIG[sd] = "visionsom_8mm_defconfig,sdcard"
SPL_BINARY = "spl/u-boot-spl.bin"

IMX_KERNEL_CONFIG_AARCH64 = "visionsom_8mm_defconfig"

DDR_FIRMWARE_NAME = "lpddr4_pmu_train_1d_imem.bin lpddr4_pmu_train_1d_dmem.bin lpddr4_pmu_train_2d_imem.bin lpddr4_pmu_train_2d_dmem.bin"

UBOOT_DTB_NAME = "visionsom-8mm.dtb"

IMXBOOT_TARGETS = "flash_evk"

SERIAL_CONSOLES = "115200;ttymxc3"

IMAGE_BOOTLOADER = "imx-boot"

LOADADDR = ""
IMX_BOOT_SEEK = "33"

IMAGE_BOOT_FILES = " \
	${KERNEL_IMAGETYPE} \
	${@make_dtb_boot_files(d)} \
"


