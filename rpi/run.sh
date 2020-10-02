#!/bin/sh
URL="https://raw.githubusercontent.com/fukatechnologies/gateway/master/rpi/installme.sh"
rm -r fuka
mkdir fuka
cd fuka
curl -k $URL -o runme.sh
bash runme.sh

chmod 777 *
sh runRpi.sh
