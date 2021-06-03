#!/usr/bin/env bash

# Update packages.
sudo apt update && sudo apt-get upgrade -y

# https://github.com/nvm-sh/nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install node

# https://pm2.keymetrics.io
npm install pm2 -g

# https://certbot.eff.org
sudo apt install certbot -y
sudo certbot certonly --standalone
sudo chown -R $USER /etc/letsencrypt/live/
sudo chown -R $USER /etc/letsencrypt/archive/

# https://ubuntu.com/server/docs/databases-mysql
sudo apt install mysql-server -y

# https://nodemailer.com/transports/sendmail/
# sudo nano /etc/hosts e.g. 198.51.100.0 (public Internet) hostname
# TXT Record @ v=spf1 a:example.com ~all Automatic
sudo apt install sendmail -y

# https://git-scm.com/book/en/v2/Git-Tools-Credential-Storage
sudo apt install git -y
git config --global credential.helper store

# https://cwiki.apache.org/confluence/display/HTTPD/NonRootPortBinding
sudo setcap cap_net_bind_service=+ep `which node`
