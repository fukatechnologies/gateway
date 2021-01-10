#!/bin/sh
URL="https://raw.githubusercontent.com/fukatechnologies/gateway/master/rpi/downloadAll.sh"
rm -r fuka
mkdir fuka

cd fuka
curl -kL $URL | bash -s 'dailyrun.sh' 'installNode.sh'

cd ..
chmod 755 fuka/*
source fuka/dailyrun.sh
