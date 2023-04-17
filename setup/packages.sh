#!/bin/bash

# System
ohai "Packages - System"
sudo sh -c 'echo "fastestmirror=True" >> /etc/dnf/dnf.conf'
sudo sh -c 'echo "defaultyes=True" >> /etc/dnf/dnf.conf'
sudo sh -c 'echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf'
sudo dnf install -y fedora-workstation-repositories
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf distro-sync
sudo dnf groupupdate -y core
sudo dnf groupupdate -y multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf install -y ngrep tcpdump vim xclip neofetch htop
sudo dnf install -y java-latest-openjdk-headless
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Nvidia
sudo dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/fedora37/x86_64/cuda-fedora37.repo
sudo dnf install kernel-headers kernel-devel tar bzip2 make automake gcc gcc-c++ pciutils elfutils-libelf-devel libglvnd-opengl libglvnd-glx libglvnd-devel acpid pkgconfig dkms
sudo dnf module install nvidia-driver:latest-dkms

# Security
ohai "Packages - Security"
sudo dnf install -y clamav clamav-update
sudo sed -i '/Example/d' /etc/freshclam.conf
sudo freshclam
sudo systemctl enable clamav-freshclam.service --now
sudo dnf install -y clamtk

sudo dnf install -y firewalld
sudo systemctl unmask firewalld
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd --set-default-zone=home
sudo firewall-cmd --remove-service=ssh --permanent --zone=home
sudo firewall-cmd --reload
sudo dnf install -y firewall-config

# Browsers
ohai "Packages - Browsers"
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install -y google-chrome-stable

# IDE
ohai "Packages - IDE"
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo dnf install -y sublime-text


ohai "Packages - Visual Studio Code"
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install -y code

# Utilities
ohai "Packages - Utilities"
sudo flatpak install -y flathub org.standardnotes.standardnotes

sudo rpm --import https://d2t3ff60b2tol4.cloudfront.net/repomd.xml.key
sudo sh -c 'echo -e "[insync]\nname=insync repo\nbaseurl=http://yum.insync.io/fedora/\$releasever/\ngpgkey=https://d2t3ff60b2tol4.cloudfront.net/repomd.xml.key" > /etc/yum.repos.d/insync.repo'
sudo dnf install -y insync

sudo dnf install -y meld unrar pdfarranger
sudo dnf install -y gnome-tweaks gnome-extensions-app

# Videos
ohai "Packages - Videos"
sudo dnf install -y celluloid
# sudo flatpak install -y shotcut kdenlive

# Fonts
ohai "Packages - Fonts"
sudo dnf install -y curl cabextract xorg-x11-font-utils fontconfig
sudo dnf install -y http://sourceforge.net/projects/mscorefonts2/files/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
sudo dnf install -y fira-code-fonts
sudo dnf install -y powerline-fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
unzip Meslo.zip -d ~/.fonts
fc-cache -fv
rm -f Meslo.zip


# Themes
ohai "Packages - Themes"
sudo dnf install -y gnome-shell-theme-flat-remix
