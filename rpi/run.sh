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

echo "Update system parameters"
export CONFIG_KEYS="ewoidXJsIjoiaHR0cHM6Ly9mdWthLXRlY2hub2xvZ2llcy5maXJlYmFzZ$"
export FURL="https://fuka-technologies.firebaseio.com/"
export FNAME="FukaSettings.json"
export FRANDM="SGVsbG9Xb3JsZDEyMy4="

if [ -z $HARDWARE_ID ]; then
  export HARDWARE_ID=$(curl -kL https://www.uuidgenerator.net/api/guid)
fi
echo "ID: $HARDWARE_ID"

echo "Rebooting system"
sudo reboot
