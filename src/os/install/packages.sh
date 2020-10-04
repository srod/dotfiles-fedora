#!/bin/bash

# System
print_in_blue "\n   Packages - System\n\n"
sudo sh -c 'echo "fastestmirror=True" >> /etc/dnf/dnf.conf'
sudo sh -c 'echo "defaultyes=True" >> /etc/dnf/dnf.conf'
sudo dnf distro-sync
sudo dnf groupupdate -y core
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sudo dnf install nano vim wget tar net-tools curl htop neofetch

# Security
sudo chattr +i /etc/passwd
sudo chattr +i /etc/shadow
sudo sed -i '/^PermitRootLogin/s/yes/no/' /etc/ssh/sshd_config
sudo systemctl restart sshd
