#!/bin/bash
echo y | sudo add-apt-repository universe
sudo apt-get update
sudo apt-get install vim git zsh curl gnome-tweak tool powerline-fonts vlc -y
sudo sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/vinceliuice/Orchis-theme.git ~/Downloads/orchis/
~/Downloads/orchis/install.sh -t purple

wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

wget https://prerelease.keybase.io/keybase_amd64.deb

sudo apt update

sudo apt install google-chrome-stable -y
sudo dkpg --install ~/Downloads/keybase_amd64.deb

sudo snap install --classic code
sudo snap install --classic godot
sudo snap install --classic discord
sudo snap install --classic spotify

cp ./.zshrc ~/.zshrc
