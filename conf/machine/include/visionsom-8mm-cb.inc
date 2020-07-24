# Provides the VisionSOM-8MM-CB common settings
 
MACHINEOVERRIDES =. "mx8:mx8m:mx8mm:"

require conf/machine/include/imx-base.inc
require conf/machine/include/tune-cortexa53.inc

MACHINE_FEATURES += " pci wifi bluetooth optee qca9377 bcm43455 bcm4356 bcm4359"

UBOOT_CONFIG ??= "sd"
UBOOT_CONFIG[sd] = "visionsom_8mm_defconfig,sdcard"
SPL_BINARY = "spl/u-boot-spl.bin"

DDR_FIRMWARE_NAME = "lpddr4_pmu_train_1d_imem.bin lpddr4_pmu_train_1d_dmem.bin lpddr4_pmu_train_2d_imem.bin lpddr4_pmu_train_2d_dmem.bin"

UBOOT_DTB_NAME = "visionsom-8mm.dtb"

IMXBOOT_TARGETS = "flash_evk"

SERIAL_CONSOLES = "115200;ttymxc0"

IMAGE_BOOTLOADER = "imx-boot"

LOADADDR = ""
IMX_BOOT_SEEK = "33"

# PREFERRED_PROVIDER_u-boot_visionsom-8mm-cb = "u-boot-somlabs"
# PREFERRED_PROVIDER_virtual/bootloader_visionsom-8mm-cb = "u-boot-somlabs"
# EXTRA_IMAGEDEPENDS += "u-boot-somlabs"

IMAGE_BOOT_FILES = " \
	${KERNEL_IMAGETYPE} \
	${@make_dtb_boot_files(d)} \
"


