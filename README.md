# meta-somlabs

## Introduction

Meta-somlabs is a layer providing the SoMLabs modules and carrier boards hardware support for Yocto-based NXP Linux system. It may be used on top of the meta-imx layer provided by NXP or directly with meta-freescale maintained by the community.

## System image

This layer should be used in order to build the system image. It adds a new example image called somlabs-image and two distros: somlabs-fb and somlabs-xwayland. It also includes the SoMLabs demo application using the GTK and GStreamer libraries.

## Building the system image

The general description of the building process is described in the iMX Yocto Project User's Guide document for version 6.12.34-2.1.0:

https://www.nxp.com/design/software/embedded-software/i-mx-software/embedded-linux-for-i-mx-applications-processors:IMXLINUX

**NOTE: Since imx-somlabs-6.6.52-2.2.0 version gstreamer with wayland sink is no longer supported on iMX6ULL platforms. In order to use this feature the imx-somlabs-6.6.23-2.0.0 scarthgap version shall be used configured using respective repo xml files.**

The summary of required steps including the meta-somlabs layer is shown below.

* with meta-imx usage

```shell
mkdir imx-yocto-bsp
cd imx-yocto-bsp
repo init -u https://github.com/SoMLabs/imx-meta-somlabs -b walnascar -m imx-somlabs-6.12.34-2.1.0.xml
repo sync
```

* with meta-freescale (without meta-imx support)

```shell
mkdir imx-yocto-bsp
cd imx-yocto-bsp
repo init -u https://github.com/SoMLabs/imx-meta-somlabs -b walnascar -m fsl-somlabs-6.12.34-2.1.0.xml
repo sync
```

System building may be configured for one of the available machine configurations:

* somlabs-iot-box-6ull - SoMLabs IoT-BOX board with VisionSOM-6ULL modules
* spacesom-8mplus-cb - SpaceCB-8Mplus board with SpaceSOM-8Mplus module
* starsbc-6ull - StarSBC-6ULL board with or without the COMM shield
* starsom-cb-6ull - StarCB-6ULL board with StarSOM-6ULL modules
* titansbc-8mmini - TitanSBC-8Mmini board
* visioncb-6ull-std - VisionCB-6ULL-STD board with VisionSOM-6ULL modules 
* visionsom-8mm-cb - VisionCB-8M board family with VisionSOM-8Mmini modules
* visionsom-imx93 - VisionCB-iMX93-STD board family with VisionSOM-iMX93 modules

The following system distributions were tested on SoMLabs modules:

* somlabs-fb - distribution without graphical environment
* somlabs-xwayland - distribution with wayland and x11 enabled

**NOTE: Since 6.1.x kernel uptade the GPU drivers on iMX8MPlus require modules with at least 2GB RAM available. For 1GB RAM spacesom-8mplus-cb machine use somlabs-fb distro only.**

**NOTE: In case of issues with audio/video playback using gstreamer on spacesom-8mplus-cb board with meta-freescale layers, the following commands may be executed to use a newer version of imx-vpu-hantro drivers.**

```shell
cd sources
git clone -b rel_imx_6.12.34_2.1.0 https://github.com/nxp-imx/meta-imx
cp -r meta-imx/meta-imx-bsp/recipes-bsp/imx-vpu-hantro* meta-somlabs/recipes-bsp/
cp -r meta-imx/meta-imx-bsp/classes meta-somlabs/
```

System building may be started by the following commands:

* with meta-imx usage

```shell
DISTRO=<SELECTED_DISTRIBUTION> MACHINE=<SELECTED_MACHINE> source imx-somlabs-setup-release.sh -b <BUILD_DIRECTORY>
bitbake somlabs-image
```

* with meta-freescale (without meta-imx support)

```shell
DISTRO=<SELECTED_DISTRIBUTION> MACHINE=<SELECTED_MACHINE> source fsl-somlabs-setup-environment.sh <BUILD_DIRECTORY>
bitbake somlabs-image
```

The system image is located in the somlabs-image-<SELECTED_MACHINE>.rootfs.wic.zst or somlabs-image-<SELECTED_MACHINE>.rootfs.wic.gz file in the tmp/deploy/images/<SELECTED_MACHINE> directory. It should be extracted with one of the commands:

```shell
unzstd somlabs-image-<SELECTED_MACHINE>.rootfs.wic.zst 
gunzip somlabs-image-<SELECTED_MACHINE>.rootfs.wic.gz
```

The instruction for the eMMC memory image installation may be found on the wiki page for corresponding module:

* https://wiki.somlabs.com/index.php/Main_Page
