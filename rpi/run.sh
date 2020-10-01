url="https://raw.githubusercontent.com/fukatechnologies/gateway/master/rpi/installme.sh"
mkdir fuka
rm -r fuka/*
cd fuka
curl -k $url -o runme.sh
sh runme.sh
