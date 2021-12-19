#!/usr/bin/env bash
# script author: Raekye
# server: Minecraft Forge 1.17+
# project developers: Minecraft Forge team
# project website: http://minecraftforge.net

set -e

FORGE_VERSION="$MINECRAFT_FLAVOUR_VERSION"
FORGE_INSTALLER="forge-$FORGE_VERSION-installer.jar"
FORGE_SERVER="forge-$FORGE_VERSION.jar"
URL="http://files.minecraftforge.net/maven/net/minecraftforge/forge/$FORGE_VERSION/$FORGE_INSTALLER"

dnf -y install java-latest-openjdk-headless

rm -f "$FORGE_INSTALLER"
curl -Lo "$FORGE_INSTALLER" "$URL"
java -jar "$FORGE_INSTALLER" --installServer
mv "$FORGE_SERVER" minecraft_server-run.jar
echo "eula=true" > eula.txt
echo "enable-query=true" > server.properties
