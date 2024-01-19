FROM postgres:latest AS postgres-database-build-stage

RUN apt-get update -yq
RUN apt-get install openssh-server systemd iputils-ping -yq


FROM postgres-database-build-stage AS prepare-file-stage

COPY sshd_config /etc/ssh/sshd_config.d

RUN useradd nagios -m -U 

# https://stackoverflow.com/questions/2150882/how-to-automatically-add-user-account-and-password-with-a-bash-script
RUN echo nagios:password | chpasswd

WORKDIR /