#!/bin/bash
# script author: Raekye
# server: Vanilla
# server developers: Mojang
# server website: https://minecraft.net

set -e

VANILLA_VERSION="$MINECRAFT_FLAVOUR_VERSION"
URL="https://s3.amazonaws.com/Minecraft.Download/versions/$VANILLA_VERSION/minecraft_server.$VANILLA_VERSION.jar"

rm -rf minecraft_server-run.jar
wget -O minecraft_server-run.jar "$URL"
echo "eula=true" > eula.txt
echo "enable-query=true" > server.properties
