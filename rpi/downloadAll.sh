#!/bin/bash
DUMP="https://raw.githubusercontent.com/fukatechnologies/gateway/master/rpi"
FILES=("dailyrun.sh" "installNode.sh")

DownloadFile () {
   echo "Downloading $2"
   curl -k $1/$2 > $2
   echo ""
   return 0
}

echo "Downloading to local folder"
for file in ${FILES[*]}; do
  DownloadFile $DUMP $file
done

source dailyrun.sh
