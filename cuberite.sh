#!/bin/bash
# script author: Raekye
# server: MCServer
# project developers: Cuberite team
# project website: http://cuberite.org

set -e

URL="https://download.cuberite.org/linux-x86_64/Cuberite.tar.gz"

rm -rf cuberite.tar.gz
wget -O cuberite.tar.gz "$URL"
tar --strip-components=1 -zxf cuberite.tar.gz
rm -rf cuberite.tar.gz

echo '#!/bin/sh' > minecraft_server-run.sh
echo "./Cuberite" >> minecraft_server-run.sh
chmod u+x minecraft_server-run.sh

firewall-cmd --add-port=8080/tcp
firewall-cmd --permanent --add-port=8080/tcp
