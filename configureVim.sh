#!/bin/bash

mkdir ~/.vim
mkdir ~/.vim/bundle
mkdir ~/.vim/autoload

#Check if curl is installed
command -v curl >/dev/null 2>&1 || { echo "I require curl but it's not installed. Aborting." >&2; exit 1; }

#Install pathogen
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

#Backup vimrc

if [-f ~/.vimrc ]; then
  cp ~/.vimrc ~/.vimrc_backup
  rm ~/.vimrc
fi

#Check git is installed
command -v git >/dev/null 2>&1 || { echo "I require git but it's not installed. Aborting." >&2; exit 1; }

#Get vimrc file
cd ~
git clone https://github.com/junderhill/VimConfig.git

#get plugins

cd ~/.vim/bundle
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/sjl/gundo.vim.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/kien/rainbow_parentheses.vim.git
git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/altercation/vim-colors-solarized.git
git clone https://github.com/Lokaltog/vim-easymotion.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/nathanaelkane/vim-indent-guides.git
git clone https://github.com/plasticboy/vim-markdown.git
git clone https://github.com/tsaleh/vim-matchit.git