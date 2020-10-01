#!/bin/sh
DUMP="https://raw.githubusercontent.com/fukatechnologies/gateway/master/dump"
FILES=("FUKADBRPI" "FUKARPI" "gateway.lic" "config.json")

DownloadFile () {
   echo ""
   echo "Downloading $1/$2"
   return curl -k $1/$2 > $2
}

echo ""
echo "Downloading to local folder"
for file in ${FILES[*]}; do
  DownloadFile DUMP file
done
