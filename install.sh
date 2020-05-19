#!/bin/bash

$currentDir= pwd

# update the system
sudo apt-get update
sudo apt-get -y upgrade

# install build tools for YouCompleteMe
sudo apt install -y curl build-essential cmake vim python3-dev

# install GO
cd /tmp
wget https://dl.google.com/go/go1.14.3.linux-amd64.tar.gz
sudo tar -xf go1.11.linux-amd64.tar.gz
sudo mv go /usr/local
sudo chown $USER /usr/local/go 
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH


# setup the new .vimrc file
cp ~/.vimrc ~/.vimrc_backup
cp vimrc ~/.vimrc

# create the undo directory to store undo content
mkdir -p ~/.vim/undodir

# download the vim-plug plugin
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo chown $USER ~/.vim/autoload/plug.vim

# download and install all the vim-plug plugins
vim +'PlugInstall --sync' +qa

# build the YouCompleteMe bundle
cd ~/.vim/plugged/YouCompleteMe/
python3 install.py --all

cd $currentDir

