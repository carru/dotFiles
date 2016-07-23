#!/bin/bash

REPO_FOLDER="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# tmux
echo "~/.tmux.conf"
ln -sf $REPO_FOLDER/.tmux.conf ~/.tmux.conf
