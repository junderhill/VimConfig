#!/bin/bash

mkdir ~/.vim

#Check if curl is installed
command -v curl >/dev/null 2>&1 || { echo "I require curl but it's not installed. Aborting." >&2; exit 1; }

#Install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle; \
  curl -LSso ~/.vim/autoload/pathogen.vim \
  https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

#Backup vimrc

if [ -f ~/.vimrc ] 
then
  cp ~/.vimrc ~/.vimrc_backup
  rm ~/.vimrc
fi

#Check git is installed
command -v git >/dev/null 2>&1 || { echo "I require git but it's not installed. Aborting." >&2; exit 1; }

cp vimrc ~/.vimrc

#get plugins
cd ~/.vim/bundle

git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/nathanaelkane/vim-indent-guides.git
git clone https://github.com/plasticboy/vim-markdown.git

git clone https://github.com/w0rp/ale.git

git clone https://github.com/OmniSharp/omnisharp-vim.git 
git clone https://github.com/nickspoons/vim-sharpenup.git
