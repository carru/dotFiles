#!/bin/bash

REPO_PATH=$HOME"/dotFiles"

sudo yum -y install git
git clone https://github.com/carru/dotFiles.git $REPO_PATH

chmod +x $REPO_PATH/scripts/*.sh

$REPO_PATH/scripts/install_tools.sh
$REPO_PATH/scripts/create_symlinks.sh
