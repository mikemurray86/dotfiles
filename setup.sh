#! /bin/bash

function install_software (){
	os=$( grep -P -o '(?<=^NAME=).+' /etc/os-release )
	case $os in
		"*Arch*")
			sudo pacman -S $1
			;;
		"*Ubuntu*")
			sudo apt -y install $1
			;;
		"*Fedora*")
			sudo dnf install $1
			;;
		*)
			echo "This OS is not supported"
			exit 1
			;;
	esac
}
function airline_prep (){
	if ! type -p git &> /dev/null
	then
		read -p 'Did not find Git. Should it be installed? (y/n) ' ans
		if ans -eq 'y'
		then
			install_software git
		else
			echo "Git not installed. Please edit the .vimrc to remove airline."
		fi
	fi
}
# Tests if config files are already present and moves them if they exist before linking the files
[ -f ${HOME}/.bashrc ] &&  mv ${HOME}/.bashrc ${HOME}/.bashrc_orig
ln ./bashrc ${HOME}/.bashrc
echo "${HOME}/.bashrc set"

airline_prep
[ -f ${HOME}/.vimrc ] && mv ${HOME}/.vimrc ${HOME}/.vimrc_orig
ln ./vimrc ${HOME}/.vimrc
echo "${HOME}/.vimrc set"

if type -p tmux &>/dev/null
then
	[ -f ${HOME}/.tmux.conf ] && mv ${HOME}/.tmux.conf ${HOME}/.tmux.conf.orig
	ln ./tmux.conf ${HOME}/.tmux.conf
	echo "${HOME}/.tmux.conf set"
fi
