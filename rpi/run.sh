#!/bin/sh
URL="https://raw.githubusercontent.com/fukatechnologies/gateway/master/rpi/downloadAll.sh"
rm -r fuka
mkdir fuka
cd fuka
curl -kL $URL | bash -

chmod 755 *
