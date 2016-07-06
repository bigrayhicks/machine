#!/bin/bash
sed -i 's/http:\/\/http.debian.net/http:\/\/cloudfront.debian.net/g' /etc/apt/sources.list
apt-get update
# install curl to fix broken wget while retrieving content from secured sites
apt-get -y install curl git-core


