#!/bin/bash

set -e

URL="https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar"
CRAFTBUKKIT_INSTALLER="BuildTools.jar"
CRAFTBUKKIT_JAR="BuildTools/craftbukkit-1.8.jar"
MINECRAFT_DIR="/home/mcuser/minecraft"

rm -rf BuildTools
mkdir BuildTools
pushd BuildTools
wget -O "$CRAFTBUKKIT_INSTALLER" "$URL"
java -jar "$CRAFTBUKKIT_INSTALLER"
popd
mv "$CRAFTBUKKIT_JAR" minecraft_server-run.jar
echo "eula=true" > eula.txt
echo "enable-query=true" > server.properties
rm -rf BuildTools