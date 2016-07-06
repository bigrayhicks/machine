#!/bin/bash

# Ansible prequesites
#apt-get -y install python ruby ruby-json facter ohai


apt-get install -y python-setuptools
easy_install pip
pip install paramiko PyYAML Jinja2 httplib2 six
pip install ansible

# Install backports for wheezy
if [ $(facter lsbdistcodename) = 'wheezy' ] ; then
    echo "deb http://http.debian.net/debian wheezy-backports main" > /etc/apt/sources.list.d/backports.list
    apt-get update
fi

# Install Ansible
apt-get -y install ansible



