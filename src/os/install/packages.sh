#!/bin/bash

# declare -r LOCAL_SHELL_CONFIG_FILE="$HOME/.bash.local"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# System
print_in_blue "\n   Packages - System\n\n"
# package_install "Bat" "bat"
sudo apt install -y bat
# package_install "Ncdu" "ncdu"
sudo apt install -y ncdu
# package_install "Ngrep" "ngrep"
sudo apt install -y ngrep
# package_install "Nmap" "nmap"
sudo apt install -y nmap
# package_install "Prettyping" "prettyping"
# package_install "Tcpdump" "tcpdump"
sudo apt install -y tcpdump
# package_install "Vim" "vim"
sudo apt install -y vim
# package_install "Java" "default-jdk"
sudo apt install -y default-jdk
# package_install "Xclip" "xclip"
sudo apt install -y xclip
# package_install "Neofetch" "neofetch"
sudo apt install -y neofetch
# package_install "Htop" "htop"
sudo apt install -y htop
# package_install "Snap" "snapd"
sudo apt install -y snapd

# execute ". $LOCAL_SHELL_CONFIG_FILE" "Load env"

# Security
# package_install "Clamav" "clamav"
sudo apt install -y clamav
sudo sed -i '/Example/d' /etc/clamav/freshclam.conf
sudo systemctl enable clamav-freshclam.service
# execute \
#     "sudo sed -i '/Example/d' /etc/clamav/freshclam.conf" \
#     "Set up Clamav config files"
# execute \
#     "sudo systemctl enable clamav-freshclam.service" \
#     "Enable Freshclam"
# package_install "UFW" "ufw gufw"
sudo apt install -y ufw gufw
sudo systemctl enable ufw.service
# execute \
#     "sudo systemctl enable ufw.service" \
#     "Enable UFW"

# Browsers
print_in_blue "\n   Packages - Browsers\n\n"
# snap_install "Brave" "brave"
sudo snap install brave
# package_install "Chromium" "chromium"
sudo apt install -y chromium

# GPG
print_in_blue "\n   Packages - GPG\n"
# execute \
#     "curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb && sudo apt-get install ./keybase_amd64.deb" \
#     "Keybase"

curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
sudo apt install -y ./keybase_amd64.deb
run_keybase
rm -rf keybase_amd64.deb

# IDE
print_in_blue "\n   Packages - IDE\n\n"
# snap_install "Sublime Text" "sublime-text --classic"
sudo snap install sublime-text --classic
# snap_install "Visual Studio Code" "code --classic"

print_in_blue "\n   Package - Visual Studio Code\n\n"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt install -y apt-transport-https
sudo apt update
sudo apt install -y code
rm microsoft.gpg

# Terminal
print_in_blue "\n   Packages - Terminal\n\n"
# package_install "ZSH Completions" "zsh-completions"

# Utilities
# package_install "Dropbox" "nautilus-dropbox"
sudo apt install -y nautilus-dropbox
# execute \
#     "sudo add-apt-repository -y ppa:openrazer/stable && sudo apt-get update && sudo apt-get install -y openrazer-meta" \
#     "OpenRazer"
sudo add-apt-repository -y ppa:openrazer/stable
sudo apt-get update
sudo apt-get install -y openrazer-meta
sudo gpasswd -a rodolphe plugdev

# execute \
#     "sudo gpasswd -a rodolphe plugdev" \
#     "Add rodolphe to plugdev"

# execute \
#     "sudo add-apt-repository -y ppa:polychromatic/stable && sudo apt-get update && sudo apt-get install -y polychromatic" \
#     "Polychromatic"

sudo add-apt-repository -y ppa:polychromatic/stable
sudo apt-get update
sudo apt-get install -y polychromatic

# snap_install "Simple Note" "simplenote"
sudo snap install simplenote

# execute \
#     "sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35C && sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys ACCAF35C" \
#     "Insync Keys"

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35C
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys ACCAF35C

sudo touch /etc/apt/sources.list.d/insync.list
echo 'deb http://apt.insync.io/ubuntu eoan non-free contrib' | sudo tee -a /etc/apt/sources.list.d/insync.list
sudo apt-get update
sudo apt-get install -y insync

# execute \
#     "sudo touch /etc/apt/sources.list.d/insync.list && echo 'deb http://apt.insync.io/ubuntu eoan non-free contrib' | sudo tee -a /etc/apt/sources.list.d/insync.list && sudo apt-get update && sudo apt-get install -y insync" \
#     "Insync"

# package_install "Meld" "meld"
sudo apt-get install -y meld
# package_install "Unrar" "unrar"
sudo apt-get install -y unrar
# package_install "PDF Arranger" "pdfarranger"
sudo apt-get install -y pdfarranger
# package_install "Youtube dl" "youtube-dl"
sudo apt-get install -y youtube-dl

# execute \
#     "echo 'deb https://deb.etcher.io stable etcher' | sudo tee /etc/apt/sources.list.d/balena-etcher.list && sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61" \
#     "Etcher Keys"

echo "deb https://deb.etcher.io stable etcher" | sudo tee /etc/apt/sources.list.d/balena-etcher.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
sudo apt-get update
sudo apt-get install -y balena-etcher-electron

# execute \
#     "sudo apt-get update && sudo apt-get install -y balena-etcher-electron" \
#     "Etcher"

# Videos
print_in_blue "\n   Packages - Videos\n\n"
# package_install "VLC" "vlc"
sudo apt-get install -y vlc
# snap_install "Shotcut" "shotcut"
sudo snap install shotcut --classic
# snap_install "Kdenlive" "kdenlive"
sudo snap install kdenlive

# Fonts
# print_in_blue "\n   Packages - Fonts\n\n"
# yay_install "Hack Nerd" "nerd-fonts-hack"
# yay_install "TTF ms fonts" "ttf-ms-fonts"
# yay_install "TTF Monaco" "ttf-monaco"
# yay_install "TTF Vista Fonts" "ttf-vista-fonts"
# yay_install "TTF Google Fonts" "ttf-google-fonts-git"
# package_install "TTF Dejavu" "ttf-dejavu"
# yay_install "TTF Fira Code" "ttf-fira-code"
# package_install "TTF Liberation" "ttf-liberation"
# package_install "Noto Fonts" "noto-fonts"
# package_install "Emoji" "noto-fonts-emoji"
# package_install "TTF Inconsolata" "ttf-inconsolata"
# package_install "Terminus Font" "terminus-font"
# package_install "Cantarell Fonts" "cantarell-fonts"
# package_install "TTF Bitstream Vera" "ttf-bitstream-vera"
# package_install "TTF Hack" "ttf-hack"
# yay_install "TTF Mac Fonts" "ttf-mac-fonts"

# YARN
if [ -d "$HOME/.nvm" ]; then
    print_in_blue "\n   Packages - Node\n\n"
    # execute \
    #     "curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && echo 'deb https://dl.yarnpkg.com/debian/ stable main' | sudo tee /etc/apt/sources.list.d/yarn.list" \
    #     "Yarn Keys"

    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo 'deb https://dl.yarnpkg.com/debian/ stable main' | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt-get update
    sudo apt-get install --no-install-recommends -y yarn
    
    # execute \
    #     "sudo apt-get update && sudo apt-get install --no-install-recommends yarn" \
    #     "Yarn"
fi
