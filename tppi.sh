#!/bin/bash
# script author: MarMed
# modpack: Test Pack Please Ignore
# modpack developers: TPPI Dev Team
# modpack website: http://www.reddit.com/r/TestPackPleaseIgnore/

set -e

URL="http://england1.creeperrepo.net/FTB2/modpacks%5ETPPI%5E1_1_2%5ETPPIServer.zip"
TPPI_PACK="TPPI.zip"
TPPI_SH="ServerStart.sh"


WD="$(pwd)"
cd /tmp
rm -rf tppi
mkdir tppi
cd tppi
wget -O "$TPPI_PACK" "$URL"
unzip "$TPPI_PACK"
mv "$TPPI_SH" minecraft_server-run.sh
cat server.properties | sed -e "s/enable-query=false/enable-query=true/" > server.properties.new
mv server.properties.new server.properties
rm -rf "$TPPI_PACK"
cp -r . "$WD/"
cd ..
rm -rf tppi