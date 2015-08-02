#!/bin/bash
# script author: MarMed
# server: CraftBukkit
# project developers: Spigot and CraftBukkit team
# project website: http://spigotmc.org

set -e

URL="https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar"
CRAFTBUKKIT_INSTALLER="BuildTools.jar"
CRAFTBUKKIT_JAR="BuildTools/craftbukkit-1.8.8.jar"

WD="$(pwd)"
cd /tmp
rm -rf craftbukkit
mkdir craftbukkit
cd craftbukkit
mkdir BuildTools
cd BuildTools
wget -O "$CRAFTBUKKIT_INSTALLER" "$URL"
java -jar "$CRAFTBUKKIT_INSTALLER"
cd ..
mv "$CRAFTBUKKIT_JAR" minecraft_server-run.jar
echo "eula=true" > eula.txt
echo "enable-query=true" > server.properties
rm -rf BuildTools
cp -r . "$WD/" 
cd ..
rm -rf craftbukkit
