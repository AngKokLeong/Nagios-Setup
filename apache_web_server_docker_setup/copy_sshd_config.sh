#!/bin/sh

if test ! -d /etc/ssh/sshd_config.d; then 
        mkdir /etc/ssh/sshd_config.d 
        cat sshd_config > /etc/ssh/sshd_config.d 
    else 
        cat sshd_config > /etc/ssh/sshd_config.d 
fi
