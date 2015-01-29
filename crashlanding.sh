#!/bin/bash

set -e

URL="http://england1.creeperrepo.net/FTB2/modpacks%5ECrashLanding%5E1_1_3%5ECrashLandingServer.zip"
CRASHLANDING_PACK="crashlanding.zip"
CRASHLANDING_SH="ServerStart.sh"


WD="$(pwd)"
cd /tmp
rm -rf crashlanding
mkdir crashlanding
cd crashlanding
wget -O "$CRASHLANDING_PACK" "$URL"
unzip "$CRASHLANDING_PACK"
mv "$CRASHLANDING_SH" minecraft_server-run.sh
rm -rf "$CRASHLANDING_PACK"
mv "Crash Landing 1_1_3" world
cat server.properties | sed -e "s/level-name=Crash Landing 1_1_3/level-name=world/" > server.properties.new
mv server.properties.new server.properties
cat server.properties | sed -e "s/enable-query=false/enable-query=true/" > server.properties.new
mv server.properties.new server.properties
cp -r . "$WD/" 
cd ..
rm -rf crashlanding