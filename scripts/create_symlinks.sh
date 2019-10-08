#!/bin/bash

# REPO_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_PATH="~/dotFiles"

# tmux
ln -sf $REPO_PATH/.tmux.conf ~/.tmux.conf

# vim
ln -sf $REPO_PATH/.vimrc ~/.vimrc

# bashrc
if [ -f ~/.bashrc ]; then
	echo $REPO_PATH/.shell_customizations >> ~/.bashrc
fi
