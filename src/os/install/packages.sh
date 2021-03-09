#!/bin/bash

# System
print_in_blue "\n   Packages - System\n\n"
sudo sh -c 'echo "fastestmirror=True" >> /etc/dnf/dnf.conf'
sudo sh -c 'echo "defaultyes=True" >> /etc/dnf/dnf.conf'
sudo dnf install -y fedora-workstation-repositories
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf distro-sync
sudo dnf groupupdate -y core
sudo dnf install -y ncdu ngrep tcpdump vim xclip neofetch htop
sudo dnf install -y java-latest-openjdk-headless
sudo dnf install -y snapd
sudo ln -s /var/lib/snapd/snap /snap
sudo systemctl enable snapd --now
sudo snap refresh
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Browsers
print_in_blue "\n   Packages - Browsers\n\n"
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install -y google-chrome-stable

# GPG
print_in_blue "\n   Packages - GPG\n"
sudo dnf install -y https://prerelease.keybase.io/keybase_amd64.rpm
run_keybase

# IDE
print_in_blue "\n   Packages - IDE\n\n"
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo dnf install -y sublime-text


print_in_blue "\n   Package - Visual Studio Code\n\n"
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install -y code

# Utilities
sudo rpm --import https://d2t3ff60b2tol4.cloudfront.net/repomd.xml.key
sudo sh -c 'echo -e "[insync]\nname=insync repo\nbaseurl=http://yum.insync.io/fedora/\$releasever/\ngpgkey=https://d2t3ff60b2tol4.cloudfront.net/repomd.xml.key" > /etc/yum.repos.d/insync.repo'
sudo dnf install -y insync

sudo dnf install -y meld unrar pdfarranger

# Fonts
print_in_blue "\n   Packages - Fonts\n\n"
sudo dnf install -y curl cabextract xorg-x11-font-utils fontconfig
sudo dnf install -y http://sourceforge.net/projects/mscorefonts2/files/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
sudo dnf install -y fira-code-fonts
sudo dnf install -y powerline-fonts

# Themes
sudo dnf install -y gnome-shell-theme-flat-remix

# YARN
if [ -d "$HOME/.nvm" ]; then
    print_in_blue "\n   Packages - Node\n\n"

    curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
    sudo dnf install -y yarn
fi
