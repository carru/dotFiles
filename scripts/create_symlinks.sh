#!/bin/bash

# REPO_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_PATH=$HOME"/dotFiles"

# tmux
ln -sf $REPO_PATH/.tmux.conf $HOME/.tmux.conf

# vim
ln -sf $REPO_PATH/.vimrc $HOME/.vimrc

# bashrc
if [ -f $HOME/.bashrc ]; then
	echo $REPO_PATH/.shell_customizations >> $HOME/.bashrc
fi
