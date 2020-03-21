#!/bin/bash
# script author: ZeroCharistmas
# server: Vanilla Bedrock
# server developers: Mojang
# server website: https://minecraft.net

set -e

URL="https://minecraft.azureedge.net/bin-linux/bedrock-server-1.14.32.1.zip"

rm -rf bedrock-server-1.14.32.1.zip
wget -O bedrock-server-1.14.32.1.zip "$URL"
unzip bedrock-server-1.14.32.1.zip
rm -rf bedrock-server-1.14.32.1.zip

echo '#!/bin/sh' > minecraft_server-run.sh
echo "LD_LIBRARY_PATH=. ./bedrock_server" >> minecraft_server-run.sh
chmod u+x minecraft_server-run.sh
