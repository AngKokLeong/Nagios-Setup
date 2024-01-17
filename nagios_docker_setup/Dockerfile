FROM ubuntu:22.04


WORKDIR /nagios

RUN apt-get update -yq

RUN apt-get install -yq autoconf gcc libc6 make wget unzip apache2 php libapache2-mod-php7.4 libgd-dev

#Setup Nagios

#Retrieve from this link 'https://www.nagios.org/downloads/nagios-core/thanks/'
RUN wget --inet4-only --content-disposition 'https://go.nagios.org/get-core/4-5-0/' -O nagios-4.5.0.tar.gz

RUN tar -xzvf nagios-4.5.0.tar.gz
RUN rm nagios-4.5.0.tar.gz

RUN cd nagios-4.5.0

RUN ./configure --with-httpd-conf=/etc/apache2/sites-enabled

RUN make all

# Add new user 'nagios'
RUN useradd nagios
RUN usermod -a -G nagios www-data

RUN cd /nagios

# Setup Nagios Plugin

RUN wget --inet4-only --content-disposition 'https://github.com/nagios-plugins/nagios-plugins/archive/refs/tags/2.4.8.tar.gz' -O nagios-plugins-2.4.8.tar.gz

RUN tar -xzvf nagios-plugins-2.4.8.tar.gz
RUN rm nagios-plugins-2.4.8.tar.gz
