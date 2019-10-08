#!/bin/bash

# Add IUS repo
wget https://centos7.iuscommunity.org/ius-release.rpm
sudo rpm -Uvh ius-release*rpm
rm ius-release*rpm

# Install tmux
sudo yum -y install tmux2

sudo yum -y install htop

