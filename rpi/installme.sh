#!/bin/sh
DUMP="https://raw.githubusercontent.com/fukatechnologies/gateway/v0.1/dump"
FILES=("FUKADBRPI" "FUKARPI" "gateway.lic" "config.json" "runRpi.sh")

DownloadFile () {
   echo ""
   echo "Downloading $2"
   curl -k $1/$2 > $2
   return 0
}

echo ""
echo "Downloading to local folder"
for file in ${FILES[*]}; do
  DownloadFile $DUMP $file
done
