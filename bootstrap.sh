#!/bin/sh

# Update packages.
sudo apt-get update && sudo apt-get -y upgrade

# https://github.com/nvm-sh/nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install node

# https://pm2.keymetrics.io
npm install pm2 -g

# https://certbot.eff.org/lets-encrypt/ubuntufocal-other
sudo apt-get -y install certbot
# sudo certbot certonly --standalone
# sudo sh -c 'printf "#!/bin/sh\nrunuser -u $SUDO_USER -- bash -i -c \"pm2 stop www\"\n" > /etc/letsencrypt/renewal-hooks/pre/node.sh'
# sudo sh -c 'printf "#!/bin/sh\nrunuser -u $SUDO_USER -- bash -i -c \"pm2 start www\"\n" > /etc/letsencrypt/renewal-hooks/post/node.sh'
# or
# sudo sh -c 'printf "#!/bin/sh\nreboot\n" > /etc/letsencrypt/renewal-hooks/post/node.sh'
# sudo chmod 755 /etc/letsencrypt/renewal-hooks/pre/node.sh
# sudo chmod 755 /etc/letsencrypt/renewal-hooks/post/node.sh

# https://certbot.eff.org/docs/using.html#where-are-my-certificates
# sudo chmod -R 0755 /etc/letsencrypt/{live,archive}

# https://ubuntu.com/server/docs/databases-mysql
sudo apt-get -y install mysql-server

# https://nodemailer.com/transports/sendmail/
# https://man7.org/linux/man-pages/man5/hosts.5.html#EXAMPLES
# sudo nano /etc/hosts e.g. 198.51.100.0 (public Internet) fqdn hostname
# 127.0.1.1       thishost.mydomain.org  thishost
# https://github.com/GoogleCloudPlatform/cloud-self-test-kit/blob/master/tracerouter.py#L169
# sudo echo "$(dig @ns1.google.com o-o.myaddr.l.google.com TXT +short | tr -d \")\tfqdn hostname" >> /etc/hosts
# or
# sudo echo "$(curl https://checkip.amazonaws.com)\tfqdn hostname" >> /etc/hosts
# TXT Record @ v=spf1 a:thishost.mydomain.org ~all Automatic
sudo apt-get -y install sendmail

# https://git-scm.com/book/en/v2/Git-Tools-Credential-Storage
sudo apt-get -y install git
git config --global credential.helper store

# https://cwiki.apache.org/confluence/display/HTTPD/NonRootPortBinding
sudo setcap cap_net_bind_service=+ep `which node`
