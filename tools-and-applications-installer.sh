# Author     : Fedya Serafiev
# Version    : 1.1
# License    : MIT
# Copyright  : Fedya Serafiev (2023)
# Github     : https://github.com/cezar4o/tools-and-applications-installer
# Contact    : https://urocibg.eu/
#!/bin/bash

sudo apt update

echo "installing tools"
mkdir ~/temp-install
sudo apt-get install vim git net-tools apt-transport-https curl pwgen gnome-characters keepassxc software-properties-common nmap preload tmux ansible whois telegram-desktop wget gpg -y

echo "Install AppImageLauncher"
sudo add-apt-repository ppa:appimagelauncher-team/stable
sudo apt update
sudo apt-get install appimagelauncher -y

echo "Install Brave browser"
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/brave-browser-release.gpg >/dev/null

echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install -y brave-browser

echo "Install Chrome browser"
wget -O ~/temp-install/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i ~/temp-install/google-chrome-stable_current_amd64.deb

echo "Install Nextcloud"
wget -O ~/temp-install/Nextcloud-3.9.0-x86_64.AppImage https://github.com/nextcloud-releases/desktop/releases/download/v3.9.0/Nextcloud-3.9.0-x86_64.AppImage
ail-cli integrate ~/temp-install/Nextcloud-3.9.0-x86_64.AppImage
cd ~/Applications/
chmod 755 Nextcloud*
./Nextcloud*.AppImage &
cd ~

echo "Install Viber"
wget -O ~/temp-install/viber.AppImage https://download.cdn.viber.com/desktop/Linux/viber.AppImage
ail-cli integrate ~/temp-install/viber.AppImage
cd ~/Applications/
chmod 755 viber*
./viber*.AppImage &
cd ~

echo "Install AnyDesk"
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/anydesk.gpg >/dev/null
echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list
sudo apt update
sudo apt install anydesk -y
