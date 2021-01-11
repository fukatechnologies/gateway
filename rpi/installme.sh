#!/bin/bash

echo "Installing Node and Node-red"
yes | source <(curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered)

echo "Adding to startup service"
sudo systemctl enable nodered.service

echo "Rebooting system"
sudo reboot
