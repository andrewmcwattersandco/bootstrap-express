#!/bin/sh

sudo apt update && sudo apt-get upgrade -y

sudo apt install curl
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash
nvm install node
sudo setcap cap_net_bind_service=+ep `which node`

git config --global credential.helper store

npm install pm2 -g
