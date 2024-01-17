#use 'sudo bash -x setup.bash' to execute the script
# there should be a user 'dockeradm' in the ubuntu OS

#!/bin/bash

cd /home/dockeradm/Desktop

apt-get update -yq

apt-get install -yq autoconf gcc libc6 make wget unzip apache2 php libapache2-mod-php7.4 libgd-dev

#Retrieve from this link 'https://www.nagios.org/downloads/nagios-core/thanks/'
wget --inet4-only --content-disposition 'https://go.nagios.org/get-core/4-5-0/' -O nagios-4.5.0.tar.gz

tar -xzvf nagios-4.5.0.tar.gz
rm nagios-4.5.0.tar.gz

cd nagios-4.5.0

./configure --with-httpd-conf=/etc/apache2/sites-enabled

make all


useradd nagios
usermod -a -G nagios www-data

cd /home/dockeradm/Desktop

wget --inet4-only --content-disposition 'https://github.com/nagios-plugins/nagios-plugins/archive/refs/tags/2.4.8.tar.gz' -O nagios-plugins-2.4.8.tar.gz

tar -xzvf nagios-plugins-2.4.8.tar.gz
rm nagios-plugins-2.4.8.tar.gz

