#!/bin/bash
# script author: Raekye
# server: MCServer
# project developers: MCServer team
# project website: http://mc-server.org

set -e

URL="https://raw.githubusercontent.com/mc-server/MCServer/master/easyinstall.sh"

pushd /tmp/
#curl -s "$URL" | sh
rm -f mcserver.tar.gz
wget -O mcserver.tar.gz https://gamocosm.com/assets/files/mcserver.tar.gz
tar -zxf mcserver.tar.gz
cp -r MCServer/. /home/mcuser/minecraft
rm -rf MCServer
popd

echo '#!/bin/bash' > minecraft_server-run.sh
echo "./MCServer" >> minecraft_server-run.sh
chmod u+x minecraft_server-run.sh

firewall-cmd --add-port=8080/tcp
firewall-cmd --permanent --add-port=8080/tcp
