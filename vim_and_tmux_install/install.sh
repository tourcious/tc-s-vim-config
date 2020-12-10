#!/bin/bash
# Author: wanghan
# Created Time : 2020年09月10日 星期四 19时36分20秒
# File Name: install.sh
# Description:

# 定义变量
SH_SCRIPT_PWD=$0
SH_DIR_NAME=${SH_SCRIPT_PWD%/*} #获取当前路径

if [ -f ~/.vimrc -o -d ~/.vim ]; then
	read -N 1 -p "Do you want delete old vim config?(y/n):" answer
	echo -e "\n"
	if [ $answer == "Y" -o $answer == "y" ]; then
		echo "Remove old vimcofnig ..."
		echo "Delete ~/.vim ..."
		rm -rf ~/.vim
		echo "Delete ~/.vimrc ..."
		rm -rf ~/.vimrc
	else
		echo Install FAILED!
		exit -1
	fi
fi

if [ -f ~/.tmux.conf -o -f ~/.tmux.conf.local ]; then
	read -N 1 -p "Do you want delete old tmux config?(y/n):" answer
	echo -e "\n"
	if [ $answer == "Y" -o $answer == "y" ]; then
		echo "Remove old vimcofnig ..."
		echo "Delete ~/.tmux.conf ..."
		rm -rf ~/.tmux.conf
		echo "Delete ~/.tmux.conf.local ..."
		rm -rf ~/.tmux.conf.local
	else
		echo Install FAILED!
		exit -1
	fi
fi

sudo apt install vim cscope ctags dos2unix tmux

cp -a $SH_DIR_NAME/dst_vimconfig ~/.dst_vimconfig
cp -a $SH_DIR_NAME/vim ~/.vim
cp -a $SH_DIR_NAME/.tmux.conf ~/.tmux.conf
cp -a $SH_DIR_NAME/.tmux.conf.local ~/.tmux.conf.local
ln -s ~/.dst_vimconfig/vimrc ~/.vimrc


