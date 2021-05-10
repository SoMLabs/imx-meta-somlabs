PACKAGE_INSTALL += " \
    somlabs-demo \
    "
PACKAGE_INSTALL_remove += " \
    packagegroup-core-tools-testapps \
    connman \
    "

IMAGE_FEATURES_remove = "splash"
#PACKAGE_EXCLUDE += "connman packagegroup-core-tools-testapps"
