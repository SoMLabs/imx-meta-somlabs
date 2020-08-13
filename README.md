# meta-somlabs

## Introduction

Meta-somlabs is a layer providing the VisionSOM-6ULL module and VisionCB-6ULL-STD carrier board hardware support for Yocto-based NXP Linux system.

## System image

This layer should be used in order to build the fsl-image-validation-imx image. It includes the SoMLabs demo application using the GTK and GStreamer libraries.

## Building the system image

The general description of the building process is described in the iMX Yocto Project User's Guide document:

https://www.nxp.com/docs/en/user-guide/IMXLXYOCTOUG.pdf

The summary of required steps including the meta-somlabs layer is shown below:

```shell
mkdir imx-yocto-bsp
cd imx-yocto-bsp
repo init -u https://source.codeaurora.org/external/imx/imx-manifest -b imx-linux-zeus -m imx-5.4.3-2.0.0.xml
repo sync
cd sources
git clone -b zeus https://github.com/SoMLabs/imx-meta-somlabs.git meta-somlabs
```

The following lines need to be added to the imx-yocto-bsp/imx-setup-release.sh file in order to add the meta-somlabs layer to build and enable the commercial license in build:

```shell
echo "BBLAYERS += \"\${BSPDIR}/sources/meta-somlabs\"" >> $BUILD_DIR/conf/bblayers.conf
echo "LICENSE_FLAGS_WHITELIST = \"commercial\"" >> $BUILD_DIR/conf/local.conf
```

System building may be configured for one of the available machine configurations:

* visioncb-6ull-std-emmc-btwifi - VisionCB-6ULL-STD board with eMMC and wireless modem VisionSOM-6ULL version
* visioncb-6ull-std-emmc - VisionCB-6ULL-STD board with eMMC VisionSOM-6ULL version
* visioncb-6ull-std-sd-btwifi - VisionCB-6ULL-STD board with SD-card and wireless modem VisionSOM-6ULL version
* visioncb-6ull-std-sd - VisionCB-6ULL-STD board with SD-card VisionSOM-6ULL version
* visionsom-8mm-cb-std - VisionCB-8M-STD board with SD-card and wireless modem VisionSOM-8MM version

System building may be started by the following commands:

```shell
DISTRO=fsl-imx-wayland MACHINE=<SELECTED_MACHINE> source imx-setup-release.sh -b <BUILD_DIRECTORY>
bitbake fsl-image-validation-imx
```

The system image is located in the fsl-image-validation-imx-<SELECTED_MACHINE>.sdcard.bz2 file in the tmp/deploy/images/<SELECTED_MACHINE> directory. It should be extracted and installed on a SD-card:

```shell
bunzip2 -dkf fsl-image-validation-imx-<SELECTED_MACHINE>.sdcard.bz2 
sudo dd if=fsl-image-validation-imx-<SELECTED_MACHINE>.sdcard of=/dev/sdX bs=1M
```

The instruction for the eMMC memory image installation may be found on the following wiki page:

https://wiki.somlabs.com/index.php/Writing_system_image_to_eMMC_memory
