#!/bin/bash
# script author: MarMed
# server: Spigot
# project developers: Spigot team
# project website: http://spigotmc.org

set -e

URL="https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar"
SPIGOT_INSTALLER="BuildTools.jar"
SPIGOT_JAR="BuildTools/spigot-1.8.6.jar"

WD="$(pwd)"
cd /tmp
rm -rf spigot
mkdir spigot
cd spigot
mkdir BuildTools
cd BuildTools
wget -O "$SPIGOT_INSTALLER" "$URL"
echo "Running $SPIGOT_INSTALLER - log in $(pwd)/buildtools.log"
java -jar "$SPIGOT_INSTALLER" > buildtools.log 2>&1
cd ..
mv "$SPIGOT_JAR" minecraft_server-run.jar
echo "eula=true" > eula.txt
echo "enable-query=true" > server.properties
rm -rf BuildTools
cp -r . "$WD/" 
cd ..
rm -rf spigot
