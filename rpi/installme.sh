#!/bin/sh
echo "Downloading to local folder"
curl -k https://raw.githubusercontent.com/fukatechnologies/gateway/master/mpt.zip > v1.0.zip
echo ""
echo "Unzipping to local folder"
unzip v1.0.zip
