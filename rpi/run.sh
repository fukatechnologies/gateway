#!/bin/sh

URL="https://git.io/fukagateway"
rmdir -r fuka
mkdir fuka
cd fuka
curl -k $URL -o runme.sh
sh runme.sh
