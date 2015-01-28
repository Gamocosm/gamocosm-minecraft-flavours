#!/bin/bash

set -e

URL="http://england1.creeperrepo.net/FTB2/modpacks%5EAgrarianSkiesHQ%5E3_1_2%5EAgrarianSkiesHQServer.zip"
AGRARIANSKIES_MAPURL="http://addons.cursecdn.com/files/2205/968/HomeMP.zip"
AGRARIANSKIES_PACK="agrarianskies.zip"
AGRARIANSKIES_MAP="HomeMP.zip"
AGRARIANSKIES_JAR="FTBServer-1.6.4-965.jar"

#I could use rm -rf * here but since this script is ran as root it would not be good if this script somehow gets ran somewhere it shouldn't.
rm -rf /home/mcuser/minecraft/*

wget -O "$AGRARIANSKIES_PACK" "$URL"
wget -O "$AGRARIANSKIES_MAP" "$AGRARIANSKIES_MAPURL"
unzip "$AGRARIANSKIES_PACK"
unzip "$AGRARIANSKIES_MAP"

mv "$AGRARIANSKIES_JAR" minecraft_server-run.jar
echo "enable-query=true" > server.properties
echo "level-name=HomeMP" >> server.properties
rm -rf "$AGRARIANSKIES_PACK"
rm -rf "$AGRARIANSKIES_MAP"