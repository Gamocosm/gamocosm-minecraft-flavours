#!/bin/bash
# script author: logwet
# server: PaperMC
# server developers: PaperMC team
# server website: https://papermc.io/

set -e

PAPER_VERSION="$MINECRAFT_FLAVOUR_VERSION"
URL="https://papermc.io/api/v1/paper/$PAPER_VERSION/latest/download"

dnf -y install java-latest-openjdk-headless

rm -rf minecraft_server-run.jar
wget -O minecraft_server-run.jar "$URL"
echo "eula=true" > eula.txt
echo "enable-query=true" > server.properties
