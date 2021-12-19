#!/usr/bin/env bash
# script author: Raekye
# server: Vanilla
# server developers: Mojang
# server website: https://minecraft.net

set -e

VANILLA_VERSION="$MINECRAFT_FLAVOUR_VERSION"

URL="$(python3 "$(dirname $0)/vanilla_url.py" "$VANILLA_VERSION")"

dnf -y install java-1.8.0-openjdk-headless

rm -f minecraft_server-run.jar
curl -Lo minecraft_server-run.jar "$URL"
echo "eula=true" > eula.txt
echo "enable-query=true" > server.properties
