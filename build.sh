#!/bin/bash

# Get AppImageToll
wget -c https://github.com/AppImage/AppImageKit/releases/download/12/appimagetool-x86_64.AppImage

# Download Xonotic package
wget -c -nv https://dl.xonotic.org/xonotic-0.8.2.zip
unzip xonotic-0.8.2.zip

# Create Xonotic.AppDir and move all the content into there
mkdir Xonotic.AppDir;mkdir Xonotic.AppDir/usr;mkdir Xonotic.AppDir/usr/bin
mv Xonotic/* Xonotic.AppDir/usr/bin
rmdir Xonotic

# Get more contents for AppDir
unzip AppDirContents.zip -d Xonotic.AppDir

# Start building
chmod a+x appimagetool-x86_64.AppImage
ARCH=x86_64 ./appimagetool-x86_64.AppImage Xonotic.AppDir/
