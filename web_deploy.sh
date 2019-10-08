#!/bin/bash

# Add IUS repo
wget https://centos7.iuscommunity.org/ius-release.rpm
sudo rpm -Uvh ius-release*rpm
rm ius-release*rpm
# Install tmux
sudo yum install tmux2
# Download .tmux.conf
curl https://raw.githubusercontent.com/carru/dotFiles/master/.tmux.conf -o ~/.tmux.conf
