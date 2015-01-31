#!/bin/bash
# script author: MarMed
# modpack: FTB Resurrection
# modpack developers: FTB team
# modpack website: http://www.feed-the-beast.com

set -e

URL="http://new.creeperrepo.net/FTB2/modpacks%5EFTBResurrection%5E1_0_0%5EFTBResurrectionServer.zip"
FTBRESURRECTION_PACK="FTBRESURRECTION.zip"
FTBRESURRECTION_SH="ServerStart.sh"


WD="$(pwd)"
cd /tmp
rm -rf ftbresurrection
mkdir ftbresurrection
cd ftbresurrection
wget -O "$FTBRESURRECTION_PACK" "$URL"
unzip "$FTBRESURRECTION_PACK"
mv "$FTBRESURRECTION_SH" minecraft_server-run.sh
echo "enable-query=true" > server.properties
echo "eula=true" > eula.txt
rm -rf "$FTBRESURRECTION_PACK"
cp -r . "$WD/"
cd ..
rm -rf ftbresurrection
