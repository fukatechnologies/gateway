#!/bin/bash
#https://git.io/JLxOm#
sudo npm install -g --unsafe-perm node-red
nohup node-red &
curl -kL https://raw.githubusercontent.com/fukatechnologies/gateway/master/flows/firstrun.json -o updateFlow.json
curl -v POST http://localhost:1880/flows -d @updateFlow.json --header "Content-Type: application/json"
rm updateFlow.json
