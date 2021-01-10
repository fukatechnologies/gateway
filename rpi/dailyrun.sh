#!/bin/bash
if [ -z $HARDWARE_ID ]; then
  export HARDWARE_ID=$(curl -kL https://www.uuidgenerator.net/api/guid)
fi

echo "ID: "$HARDWARE_ID
export CONFIG_KEYS="ewoidXJsIjoiaHR0cHM6Ly9mdWthLXRlY2hub2xvZ2llcy5maXJlYmFzZ$"
export FURL="https://fuka-technologies.firebaseio.com/"
export FNAME="FukaSettings.json"
export FRANDM="SGVsbG9Xb3JsZDEyMy4="
