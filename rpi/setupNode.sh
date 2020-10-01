sudo apt-get update
sudo apt-get upgrade
VERSION=v11.15.0
NODEVERSION=node-$VERSION-linux-armv6l
wget https://nodejs.org/download/release/$VERSION/$NODEVERSION.tar.gz
tar -xzf $NODEVERSION.tar.gz
cd $NODEVERSION/
sudo cp -R * /usr/local/
node -v
npm -v
