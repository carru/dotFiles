#!/bin/bash

REPO_PATH="~/dotFiles"

sudo yum -y install git
git clone https://github.com/carru/dotFiles.git ~/

chmod +x $REPO_PATH/scripts/*.sh

$REPO_PATH/scripts/install_tmux.sh
$REPO_PATH/scripts/create_symlinks.sh
