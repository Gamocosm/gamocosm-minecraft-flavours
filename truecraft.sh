#!/bin/bash
# script author: SirCmpwn
# server: TrueCraft
# project developers: SirCmpwn et al.
# project website: http://truecraft.io

set -e

URL="http://truecraft.io/builds/TrueCraft-latest.zip"
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

cat << 'EOF' > minecraft_server-run.sh
#!/bin/sh
mono TrueCraft.exe &
TRUECRAFT_PID="$!"

while read -r LINE
do
	if [ "$LINE" == "stop" ]; then
		break
	fi
done

kill "$TRUECRAFT_PID"
EOF
chmod u+x minecraft_server-run.sh

cp -r . "$WD"
cd ..
rm -rf truecraft
