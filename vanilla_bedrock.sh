#!/bin/bash
# script author: ZeroCharistmas
# server: Vanilla Bedrock
# server developers: Mojang
# server website: https://minecraft.net

set -e

BEDROCK_VERSION="$MINECRAFT_FLAVOUR_VERSION"
URL="https://minecraft.azureedge.net/bin-linux/bedrock-server-$BEDROCK_VERSION.zip"

wget -O bedrock-server.zip "$URL"
unzip bedrock-server.zip
rm -rf bedrock-server.zip

echo '#!/bin/sh' > minecraft_server-run.sh
echo "LD_LIBRARY_PATH=. ./bedrock_server" >> minecraft_server-run.sh
chmod u+x minecraft_server-run.sh
firewall-cmd --add-port=19132/udp
firewall-cmd --add-port=19132/udp --permanent
firewall-cmd --add-port=19133/udp
firewall-cmd --add-port=19133/udp --permanent
firewall-cmd --add-port=40005/udp
firewall-cmd --add-port=40005/udp --permanent
firewall-cmd --add-port=42324/udp
firewall-cmd --add-port=42324/udp --permanent
