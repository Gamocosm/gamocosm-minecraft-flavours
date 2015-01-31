#!/bin/bash
# script author: MarMed
# modpack: direwolf20
# modpack developers: FTB team
# modpack website: http://www.feed-the-beast.com

set -e

URL="http://new.creeperrepo.net/FTB2/modpacks%5Edirewolf20_17%5E1_0_3%5Edirewolf20_17-server.zip"
DIREWOLF20_PACK="direwolf20.zip"
DIREWOLF20_SH="ServerStart.sh"


WD="$(pwd)"
cd /tmp
rm -rf direwolf20
mkdir direwolf20
cd direwolf20
wget -O "$DIREWOLF20_PACK" "$URL"
unzip "$DIREWOLF20_PACK"
sh FTBInstall.sh
mv "$DIREWOLF20_SH" minecraft_server-run.sh
echo "enable-query=true" > server.properties
echo "eula=true" > eula.txt
rm -rf "$DIREWOLF20_PACK"
cp -r . "$WD/" 
cd ..
rm -rf direwolf20
