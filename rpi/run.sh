#!/bin/sh
URL="https://raw.githubusercontent.com/fukatechnologies/gateway/master/rpi/downloadAll.sh"
rm -r fuka
mkdir fuka
curl -kL $URL | bash -s 'dailyrun.sh' 'installNode.sh'

chmod 755 *
source ./fuka/dailyrun.sh
