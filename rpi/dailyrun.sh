#!/bin/bash
URL="https://raw.githubusercontent.com/fukatechnologies/gateway/master/rpi/downloadAll.sh"
rm -r fuka
mkdir fuka

cd fuka
curl -kL $URL | bash -s 'installme.sh'

echo "Setting up system"
chmod 755 *
source <(installme.sh)

echo "Cleaning up system"
cd ..
rm -r fuka
