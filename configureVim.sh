#!/bin/bash

mkdir ~/.vim

#Check if curl is installed
command -v curl >/dev/null 2>&1 || { echo "I require curl but it's not installed. Aborting." >&2; exit 1; }


#Backup vimrc

if [ -f ~/.vimrc ] 
then
  cp ~/.vimrc ~/.vimrc_backup
  rm ~/.vimrc
fi

#Check git is installed
command -v git >/dev/null 2>&1 || { echo "I require git but it's not installed. Aborting." >&2; exit 1; }

cp vimrc ~/.vimrc

