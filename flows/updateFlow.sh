#!/bin/bash
curl -kL https://github.com/fukatechnologies/gateway/blob/master/flows/firstrun.json -o updateFlow.json
curl -vX POST http://localhost:1880/flows -d @updateFlow.json --header "Content-Type: application/json"
rm updateFlow.json
