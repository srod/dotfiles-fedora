#!/bin/bash

# System
print_in_blue "\n   Packages - System\n\n"
sudo sh -c 'echo "fastestmirror=True" >> /etc/dnf/dnf.conf'
sudo sh -c 'echo "defaultyes=True" >> /etc/dnf/dnf.conf'
sudo dnf distro-sync
sudo dnf install sudo nano vim wget tar net-tools curl htop neofetch

# Security
sudo sed -i '/^PermitRootLogin/s/yes/no/' /etc/ssh/sshd_config
sudo systemctl restart sshd
