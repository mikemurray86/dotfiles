#! /bin/bash

# Tests if config files are already present and moves them if they exist before linking the files
[ -f ${HOME}/.bashrc ] &&  mv ${HOME}/.bashrc ${HOME}/.bashrc_orig
ln ./bashrc ${HOME}/.bashrc
echo "${HOME}/.bashrc set"

[ -f ${HOME}/.vimrc ] && mv ${HOME}/.vimrc ${HOME}/.vimrc_orig
ln ./vimrc ${HOME}/.vimrc
echo "${HOME}/.vimrc set"

if type -p tmux &>/dev/null
then
	[ -f ${HOME}/.tmux.conf ] && mv ${HOME}/.tmux.conf ${HOME}/.tmux.conf.orig
	ln ./tmux.conf ${HOME}/.tmux.conf
	echo "${HOME}/.tmux.conf set"
fi
