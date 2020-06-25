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
git clone https://github.com/SoMLabs/imx-meta-somlabs.git meta-somlabs
```

The following lines need to be added to the imx-yocto-bsp/imx-setup-release.sh file in order to add the meta-somlabs layer to build and enable the commercial license in build:

```shell
echo "BBLAYERS += \"\${BSPDIR}/sources/meta-somlabs\"" >> $BUILD_DIR/conf/bblayers.conf
echo "LICENSE_FLAGS_WHITELIST = \"commercial\"" >> $BUILD_DIR/conf/local.conf
```

System building may be configured and started by the following commands:

```shell
DISTRO=fsl-imx-wayland MACHINE=visionsom6ull source imx-setup-release.sh -b visionsom6ull-wayland-build
bitbake fsl-image-validation-imx
```

The system image is located in the fsl-image-validation-imx-visionsom6ull.sdcard.bz2 file in the tmp/deploy/images/visionsom6ull directory. It should be extracted and installed on a SD-card:

```shell
bunzip2 -dkf fsl-image-validation-imx-visionsom6ull.sdcard.bz2
sudo dd if=fsl-image-validation-imx-visionsom6ull.sdcard of=/dev/sdX bs=1M
```

