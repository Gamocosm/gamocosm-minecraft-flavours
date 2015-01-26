#!/bin/bash

set -e

URL="https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar"
SPIGOT_INSTALLER="BuildTools.jar"
SPIGOT_JAR="BuildTools/Spigot/Spigot-Server/target/spigot-1.8-R0.1-SNAPSHOT.jar"
MINECRAFT_DIR="/home/mcuser/minecraft"

mkdir BuildTools
cd BuildTools
wget -O BuildTools.jar "$URL"
java -jar "$SPIGOT_INSTALLER"
cd "$MINECRAFT_DIR"
mv "$SPIGOT_JAR" minecraft_server-run.jar
echo "eula=true" > eula.txt
echo "enable-query=true" > server.properties
rm -rf BuildTools