#!/bin/bash

#apparently a helper function to get the path of the script being run
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

#checking for repos
UNIVERSE_EXIST=`egrep -v '^#|^ *$' /etc/apt/sources.list /etc/apt/sources.list.d/* | grep universe`
PARTNER_EXIST=`egrep -v '^#|^ *$' /etc/apt/sources.list /etc/apt/sources.list.d/* | grep partner`
CHROME_EXIST=`egrep -v '^#|^ *$' /etc/apt/sources.list /etc/apt/sources.list.d/* | grep chrome`
OHMYZSH_EXIST=`ls /home/phiaboo/.oh-my-zsh`

if [ ! -z "$PARTNER_EXIST" ]
then
    echo partner repo already enabled
else
   echo y | sudo add-apt-repository "deb http://archive.canonical.com/ubuntu $(lsb_release -sc) partner"
fi

if [[ ! -z "$UNIVERSE_EXIST" ]]
then
    echo universe repo already enabled
else
    echo y | sudo add-apt-repository universe
fi

if [ ! -z "$CHROME_EXIST" ]
then
    echo chrome repo already enabled
else
    sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
fi

sudo apt-get update
sudo apt-get install -f vim git zsh curl gnome-tweaks fonts-powerline fonts-hack-ttf vlc python3-pip steam tilix sassc -y

cd "$parent_path"
cp ./.zshrc ~/.zshrc

if [ ! -z "$OHMYZSH_EXIST" ]
then
    echo oh-my-zsh already installed!
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

#wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -P ~/Downloads/zsh/
#sh ~/Downloads/zsh/install.sh --unattended

chsh -s $(which zsh)

git clone https://github.com/vinceliuice/Orchis-theme.git ~/Downloads/orchis/
~/Downloads/orchis/install.sh -t purple

wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

wget https://prerelease.keybase.io/keybase_amd64.deb -P ~/Downloads/

sudo apt update

sudo apt install google-chrome-stable -y
sudo dkpg --install ~/Downloads/keybase_amd64.deb

sudo snap install --classic code
sudo snap install --classic godot
sudo snap install --classic discord
sudo snap install --classic spotify

cd "$parent_path"
sudo cp -f ./mariya-takeuchi.jpg /usr/share/backgrounds/

sudo dkpg --install ~/Downloads/keybase_amd64.deb

sudo snap install --classic code
sudo snap install --classic godot

## Big assumption that gtksourceview-4 is in use and not some other version
cd "$parent_path"
sudo cp ./phedit.xml /usr/share/gtksourceview-4/styles/phedit.xml

cd "$parent_path"
dconf load / <./saved-profile.dconf
dconf load / <./phirminal.dconf



gsettings set org.gnome.desktop.background picture-uri file:////usr/share/backgrounds/mariya-takeuchi.jpg
