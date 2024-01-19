FROM httpd:latest AS apache-server-build-stage

COPY ./public-html/ /usr/local/apache2/htdocs/

RUN apt-get update -yq
#https://stackoverflow.com/questions/57607381/how-do-i-change-timezone-in-a-docker-container
RUN apt-get install tzdata -yq
ENV TZ="Asia/Singapore"

# Configure Timezone in the container
RUN ls /usr/share/zoneinfo && \
cp /usr/share/zoneinfo/Singapore /etc/localtime && \
echo "Asia/Singapore" > /etc/timezone 

RUN apt-get install openssh-server systemd nano -yq



FROM apache-server-build-stage AS prepare-file-stage

COPY sshd_config /etc/ssh/sshd_config.d
#RUN mv /etc/ssh/sshd_config.d/sshd_config /etc/ssh/sshd_config.d/passwordless_configuration.conf

RUN useradd nagios -m -U -p password

WORKDIR /

