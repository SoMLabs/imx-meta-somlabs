# meta-somlabs

## Introduction

Meta-somlabs is a layer providing the SoMLabs modules and carrier boards hardware support for Yocto-based NXP Linux system.

## System image

This layer should be used in order to build the system image. This layer adds a new example image called somlabs-image. It includes the SoMLabs demo application using the GTK and GStreamer libraries.

## Building the system image

The general description of the building process is described in the iMX Yocto Project User's Guide document:

https://www.nxp.com/docs/en/user-guide/IMXLXYOCTOUG.pdf

The summary of required steps including the meta-somlabs layer is shown below:

```shell
mkdir imx-yocto-bsp
cd imx-yocto-bsp
repo init -u https://github.com/SoMLabs/imx-meta-somlabs -b kirkstone -m imx-somlabs-5.15.52-2.1.0.xml
repo sync
```

System building may be configured for one of the available machine configurations:

* visioncb-6ull-std - VisionCB-6ULL-STD board with VisionSOM-6ULL modules 
* visionsom-8mm-cb - VisionCB-8M board family with VisionSOM-8Mmini modules
* titansbc-8mmini - TitanSBC-8Mmini board
* starsom-cb-6ull - StarCB-6ULL board with StarSOM-6ULL modules
* starsbc-6ull - StarSBC-6ULL board with or without the COMM shield
* spacesom-8mplus-cb - SpaceCB-8Mplus board with SpaceSOM-8Mplus module

The following system distributions were tested on SoMLabs modules:

* fsl-imx-fb - distribution without graphical environment for 6ULL modules
* fsl-imx-xwayland - distribution with wayland and x11 enabled

System building may be started by the following commands:

```shell
DISTRO=<SELECTED_DISTRIBUTION> MACHINE=<SELECTED_MACHINE> source imx-somlabs-setup-release.sh -b <BUILD_DIRECTORY>
bitbake somlabs-image
```

The system image is located in the somlabs-image-<SELECTED_MACHINE>.wic.zst file in the tmp/deploy/images/<SELECTED_MACHINE> directory. It should be extracted and installed on a SD-card:

```shell
unzstd somlabs-image-<SELECTED_MACHINE>.wic.zst 
sudo dd if=somlabs-image-<SELECTED_MACHINE>.wic of=/dev/sdX bs=1M
```

The instruction for the eMMC memory image installation may be found on the following wiki pages:

* VisionSOM-6ULL: https://wiki.somlabs.com/index.php/Writing_VisionSOM-6ULL_system_image_to_eMMC_memory
* VisionSOM-8MM: https://wiki.somlabs.com/index.php/Writing_VisionSOM-8MM_system_image_to_eMMC_memory
