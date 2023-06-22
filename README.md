# meta-somlabs

## Introduction

Meta-somlabs is a layer providing the VisionSOM-6ULL module and VisionCB-6ULL-STD carrier board hardware support for Yocto-based NXP Linux system.

## System image

This layer should be used in order to build the imx-image-multimedia image. It includes the SoMLabs demo application using the GTK and GStreamer libraries.

## Building the system image

The general description of the building process is described in the iMX Yocto Project User's Guide document:

https://www.nxp.com/docs/en/user-guide/IMXLXYOCTOUG.pdf

The summary of required steps including the meta-somlabs layer is shown below:

```shell
mkdir imx-yocto-bsp
cd imx-yocto-bsp
repo init -u https://github.com/nxp-imx/imx-manifest -b imx-linux-zeus -m imx-5.4.47-2.2.0.xml
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

* visioncb-6ull-std - VisionCB-6ULL-STD board with VisionSOM-6ULL modules 
* visionsom-8mm-cb - VisionCB-8M board family with VisionSOM-8Mmini modules
* visionsbc-8mmini - VisionSBC-8Mmini board

System building may be started by the following commands:

```shell
DISTRO=fsl-imx-wayland MACHINE=<SELECTED_MACHINE> source imx-setup-release.sh -b <BUILD_DIRECTORY>
bitbake imx-image-multimedia
```

The system image is located in the imx-image-multimedia-<SELECTED_MACHINE>.wic.bz2 file in the tmp/deploy/images/<SELECTED_MACHINE> directory. It should be extracted and installed on a SD-card:

```shell
bunzip2 -dkf imx-image-multimedia-<SELECTED_MACHINE>.wic.bz2 
sudo dd if=imx-image-multimedia-<SELECTED_MACHINE>.wic of=/dev/sdX bs=1M
```

The instruction for the eMMC memory image installation may be found on the following wiki pages:

* VisionSOM-6ULL: https://wiki.somlabs.com/index.php/Writing_VisionSOM-6ULL_system_image_to_eMMC_memory
* VisionSOM-8MM: https://wiki.somlabs.com/index.php/Writing_VisionSOM-8MM_system_image_to_eMMC_memory
