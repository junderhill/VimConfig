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
git clone https://github.com/kien/rainbow_parentheses.vim.git
git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/nathanaelkane/vim-indent-guides.git
git clone https://github.com/plasticboy/vim-markdown.git
# git clone https://github.com/ervandew/supertab.git ## obselete due to YouCompleteMe
git clone https://github.com/tpope/vim-endwise.git
git clone https://github.com/powerline/powerline.git

git clone https://github.com/junegunn/goyo.vim.git
git clone https://github.com/junegunn/limelight.vim.git

##python plugins
git clone https://github.com/nvie/vim-flake8.git

# colour schemes
git clone https://github.com/jnurmine/Zenburn.git
git clone git://github.com/altercation/vim-colors-solarized.git


# YouCompleteMe Setup
git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive

# check python installed
echo Checking Python is installed...
if command -v python &>/dev/null; then
    echo Woo! Python IS installed!! 
else
    echo Python is not installed but required for YouCompleteMe
    exit 1;
fi

# check cmake installed
echo Checking if cmake is installed...
if command -v cmake &>/dev/null; then
    echo Woo! cmake IS installed!! 
else
    echo Cmake is not installed but required for YouCompleteMe
    exit 1;
fi

./install.py
