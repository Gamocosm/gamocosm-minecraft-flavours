#!/bin/bash
# script author: SirCmpwn
# server: TrueCraft
# project developers: SirCmpwn et al.
# project website: http://truecraft.io

set -e

URL="http://jenkins.b303.me/job/TrueCraft/lastSuccessfulBuild/artifact/TrueCraft.zip"
TRUECRAFT_ARCHIVE="TrueCraft.zip"

sudo dnf -y install mono-core

WD="$(pwd)"
cd /tmp
rm -rf truecraft
mkdir truecraft
cd truecraft
wget -O "$TRUECRAFT_ARCHIVE" "$URL"
mkdir extracted
unzip "$TRUECRAFT_ARCHIVE"
rm "$TRUECRAFT_ARCHIVE"

cat << EOF > minecraft_server-run.sh
#!/bin/sh
mono TrueCraft.exe
EOF
chmod +x minecraft_server-run.sh

cp -r . "$WD"
cd ..
rm -rf truecraft
