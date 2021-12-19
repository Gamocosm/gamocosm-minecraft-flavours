#!/bin/bash
# script author: mastercoms
# server: Glowstone
# project developers: The Glowstone Project
# project website: https://glowstone.net

set -e

URL="https://bamboo.gserv.me/artifact/GSPP-SRV/shared/build-latestSuccessful/Version-Independent-Server-JAR/glowstone.jar"

dnf -y install java-latest-openjdk-headless

rm -rf glowstone.jar
wget -O glowstone.jar "$URL"
mv glowstone.jar minecraft_server-run.jar
