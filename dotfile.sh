#!/bin/sh

basepath=$(cd `dirname $0`; pwd)

install()
{
	echo "install"
# Vim
	ln -sf ${basepath}/vim/vimrc ~/.vimrc
# Git
	ln -sf ${basepath}/git/gitconfig ~/.gitconfig
# Tmux
	ln -sf ${basepath}/tmux/tmux.conf ~/.tmux.conf
}

uninstall() {
	echo "uninstall"
# Vim
	unlink ~/.vimrc	

# Git
	unlink ~/.gitconfig

# Tmux
	unlink ~/.tmux.conf
}

while getopts "f" opt; do
	case $opt in 
		f)
			echo "-f"
			;;
		?)
			echo "Unknow option"
	esac
done

shift $((OPTIND-1))

if [ $# -lt 1 ]; then 
	install
fi

if [ "$1" =  "install" ]; then
	install
fi

if [ "$1" = "uninstall" ]; then 
	uninstall
fi
