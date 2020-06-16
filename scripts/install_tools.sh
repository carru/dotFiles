#!/bin/bash

# Add IUS repo
wget https://repo.ius.io/ius-release-el7.rpm
sudo rpm -Uvh ius-release*rpm
rm ius-release*rpm

# Install tmux
sudo yum -y install tmux2

sudo yum -y install htop

