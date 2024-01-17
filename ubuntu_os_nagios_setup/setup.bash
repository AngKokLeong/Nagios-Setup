#!/bin/bash

cd ~/Desktop

apt-get update -yq

apt-get install -yq autoconf gcc libc6 make wget unzip apache2 php libapache2-mod-php7.4 libgd-dev

#Retrieve from this link 'https://www.nagios.org/downloads/nagios-core/thanks/'
wget --inet4-only --content-disposition 'https://go.nagios.org/get-core/4-5-0/' -O nagios-4.5.0.tar.gz

tar -xzvf nagios-4.5.0.tar.gz

cd nagios-4.5.0

./configure --with-httpd-conf=/etc/apache2/sites-enabled

make all


useradd nagios
usermod -a -G nagios www-data

cd ~/Desktop

wget --inet4-only --content-disposition 'https://github.com/nagios-plugins/nagios-plugins/archive/refs/tags/2.4.8.tar.gz' -O nagios-plugins-2.4.8.tar.gz

tar -xzvf nagios-plugins-2.4.8.tar.gz


