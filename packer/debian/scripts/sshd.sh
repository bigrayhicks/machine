#!/bin/bash

apt-get -y install openssh-server
echo "UseDNS no" >> /etc/ssh/sshd_config
echo "GSSAPIAuthentication no" >> /etc/ssh/sshd_config

ssh-keyscan -H github.com >> /etc/ssh/ssh_known_hosts
