#!/bin/bash
DUMP="https://raw.githubusercontent.com/fukatechnologies/gateway/master/rpi"
DownloadFile () {
   echo "Downloading $2"
   curl -k $1/$2 > fuka/$2
   echo ""
   return 0
}

if [ "$#" -eq 0 ]; then
   echo "File list empty"
else
   echo "Downloading to local folder"
   FILES=( "$@" )
   for file in ${FILES[*]}; do
     DownloadFile $DUMP $file
   done
fi



