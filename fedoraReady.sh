#!/bin/bash

#DIRECTORY FOR DOWNLOADS AND PROJECTS DIRECTORY
mkdir apps
mkdir fedoraReady
cd fedoraReady




#UPDATE AND UPGRADE
sudo dnf check-update && sudo dnf upgrade



#DOWNLOADS
#Atom
wget https://github.com/atom/atom/releases/download/v1.15.0/atom.x86_64.rpm

#Gitkraken
wget https://release.gitkraken.com/linux/gitkraken-amd64.tar.gz
tar -xvzf gitkraken-amd64.tar.gz

#Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

#Numix Circle Icons
wget https://github.com/numixproject/numix-icon-theme-circle/archive/master.zip
unzip master.zip
cd numix-icon-theme-circle-master
mv Numix-Circle Numix-Circle-Light /usr/share/icons
cd ..

#Skype
wget https://go.skype.com/skypeforlinux-64.rpm



#INSTALLS
#RMPFusion Repo
sudo rpm -ivh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm

#Amarok
sudo dnf install -y amarok

#Atom
sudo dnf -y install ./atom.x86_64.rpm

#Atom packages
apm install atom-bootstrap3
apm install atom-html-preview
apm install atom-material-syntax-dark
apm install atom-material-ui
apm install color-picker
apm install emmet
apm install file-icons
apm install language-javascript-jsx
apm install linter
apm install markdown-pdf
apm install minimap
apm install pigments
apm install platformio-ide-terminal

##Configrate Markdown Preview fixing Emmet Keybindign issue
echo "'atom-workspace, atom-workspace atom-text-editor': 'ctrl-shift-alt-M': 'markdown-preview:toggle'" >> $HOME/.atom/keymap.cson

#Gimp
sudo dnf install -y gimp

#Gitkraken
rsync -va --delete-after gitkraken/ /opt/GitKraken/
wget https://www.gitkraken.com/android-chrome-192x192.png
mv android-chrome-192x192.png /opt/GitKraken/gitkraken.png

#Gnome Tweak Tool
sudo dnf install -y gnome-tweak-tool

#Google Chrome
sudo yum install -y google-chrome-stable_current_x86_64.rpm

#Amarok
sudo dnf install -y amarok

#LAMP
##Apache
sudo dnf install httpd -y
sudo systemctl enable httpd
sudo systemctl start httpd

##MariaDB
sudo dnf install mariadb mariadb-server -y
sudo systemctl enable mariadb
sudo systemctl start mariadb

##PHP
sudo dnf install -y php php-common php-pdo php-gd php-mbstring

#MP3 Plugins
sudo dnf install -y gstreamer1-plugins-base gstreamer1-plugins-good gstreamer1-plugins-ugly gstreamer1-plugins-bad-free gstreamer1-plugins-bad-free gstreamer1-plugins-bad-freeworld gstreamer1-plugins-bad-free-extras ffmpeg

#Node Version Manager
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash

#Skype
sudo dnf install -y skype*.rpm

#Transmission
sudo dnf install -y transmission

#VLC
sudo dnf -y install vlc

#YouTube Downloader
sudo dnf install -y youtube-dl


#CLEANING TIME
cd ..
rm -rf fedoraReady

#Download IDEs
##PHPStorm
wget https://download.jetbrains.com/webide/PhpStorm-2017.1.tar.gz

##WebStorm
wget https://download.jetbrains.com/webstorm/WebStorm-2017.1.tar.gz

#Setting MariaDB root password
sudo mysql_secure_installation

#Enabling superuser for create a app entry
sudo su
printf '%s\n' '[Desktop Entry]' 'Encoding=UTF-8' 'Name=Gitkraken' 'Comment=GUI for git' 'Exec=/opt/GitKraken/gitkraken' 'Icon=/opt/GitKraken/gitkraken.png' 'Terminal=false' 'Type=Application' 'Categories=GNOME;Application;Development;' 'StartupNotify=true' > /usr/share/applications/gitkraken.desktop
exit

#Open Chrome and download Telegram
google-chrome https://telegram.org/dl/desktop/linux
