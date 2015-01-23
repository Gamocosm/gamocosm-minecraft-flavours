#!/bin/bash

set -e

URL="https://raw.githubusercontent.com/mc-server/MCServer/master/easyinstall.sh"

pushd /tmp/
curl -s "$URL" | sh
cp -r MCServer/. /home/mcuser/minecraft
rm -rf MCServer
popd

echo '#!/bin/bash' > minecraft_server-run.sh
echo "./MCServer" >> minecraft_server-run.sh
chmod u+x minecraft_server-run.sh
