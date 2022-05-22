#!/bin/bash
COLUMNS=$(tput cols) 
title="Welcome To Conf Apache" 
printf "\e[1;33m%*s\e[0m\n" $(((${#title}+$COLUMNS)/2)) "$title"

echo  Installing Apache2
echo -ne '#####                     (33%)\r'
sleep 1
sudo apt-get install apache2 > /dev/null
echo -ne '#############             (66%)\r'
sleep 1
echo -ne '#######################   (100%)\r'
echo -ne '\n'
echo Done

echo -e      "\n"
echo Configuring Apache2

echo -n "Domain Name ?  " 
read domain

if [ -d /var/www/$domain ]
then
  echo "Directory already exits"
else 
  mkdir /var/www/$domain
fi
echo "
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    ServerName $domain
    ServerAlias www.$domain 
    DocumentRoot /var/www/$domain
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
" > /etc/apache2/sites-available/$domain.conf
a2dissite 000-default.conf
a2ensite $domain.conf

systemctl start apache2

sudo snap install core
sudo snap refresh core

sudo snap install --classic certbot
if [[ ! (-f /usr/bin/certbot) ]]
then
  sudo ln -s /snap/bin/certbot /usr/bin/certbot
fi
sudo certbot --apache

