#!/bin/bash

set -e

URL="http://england1.creeperrepo.net/FTB2/modpacks%5EAgrarianSkiesHQ%5E3_1_2%5EAgrarianSkiesHQServer.zip"
AGRARIANSKIES_MAPURL="http://addons.cursecdn.com/files/2205/968/HomeMP.zip"
AGRARIANSKIES_PACK="agrarianskies.zip"
AGRARIANSKIES_MAP="HomeMP.zip"
AGRARIANSKIES_SH="ServerStart.sh"

WD="$(pwd)"
cd /tmp
rm -rf agrarianskies
mkdir agrarianskies
cd agrarianskies
wget -O "$AGRARIANSKIES_PACK" "$URL"
wget -O "$AGRARIANSKIES_MAP" "$AGRARIANSKIES_MAPURL"
unzip "$AGRARIANSKIES_PACK"
unzip "$AGRARIANSKIES_MAP"
mv HomeMP world
mv "$AGRARIANSKIES_SH" minecraft_server-run.sh
echo "enable-query=true" > server.properties
rm -rf "$AGRARIANSKIES_PACK"
rm -rf "$AGRARIANSKIES_MAP"
cp -r . "$WD/" 
cd ..
rm -rf agrarianskies