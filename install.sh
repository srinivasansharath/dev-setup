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
cd $CURRENTDIR 
sudo cp ~/.vimrc ~/.vimrc_backup 
sudo chown $USER:$GROUP ~/.vimrc_backup 
sudo cp ./vimrc ~/.vimrc 
sudo chown $USER:$GROUP ~/.vimrc 

# create the undo directory to store undo content
sudo mkdir -p ~/.vim/undodir
sudo chown $USER:$GROUP -R ~/.vim 

# download the vim-plug plugin
sudo mkdir -p ~/.vim/autoload/
sudo chown $USER:$GROUP -R ~/.vim/autoload

sudo curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo chown $USER:$GROUP -R ~/.vim/autoload/plug.vim

# download and install all the vim-plug plugins
vim +'PlugInstall --sync' +qa

# build the YouCompleteMe bundle
#cd ~/.vim/plugged/YouCompleteMe/
#python3 install.py --all

cd $CURRENTDIR

echo 'colorscheme gruvbox' >> ~/.vimrc
sudo chmod 777 /tmp/vim-rtags-python.log

