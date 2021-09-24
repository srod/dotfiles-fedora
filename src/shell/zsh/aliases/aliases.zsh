# Command upgrades
alias ll="ls -alh"
alias ln="ln -v"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias vi="/usr/bin/vim"
alias ncdu="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"

# Navigation
alias dotfiles="cd $DOTFILES"

# Maintenance
alias lsdu="du -csh $(pwd)"
alias check-space="du -h ~/ | grep '^[0-9]*.[0-9]G'"
alias sizedir="du -sh */ | sort -h"
alias pid="ps x | grep -i $1"
alias grep="grep --color=auto"
alias aliases="subl $DOTFILES/src/shell/zsh/aliases/aliases.zsh"

# Update
alias fedoraup="sudo dnf upgrade"
alias flatpakup="flatpak update"
alias snapup="sudo snap refresh"
alias npmup="npm -g update; npm install -g npm"
alias update="fedoraup; flatpakup; snapup; npmup"

# Work
alias work="cd ~/Insync/rodolphe.stoclin@outlook.fr/OneDrive/www"

# Network
alias network.ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias network.ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"
alias network.speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python - --server 24215"
alias network.ping='prettyping --nolegend'
alias ping=network.ping

# View HTTP traffic
alias network.sniff="sudo ngrep -d 'wlo1' -t '^(GET|POST) ' 'tcp and port 80'"
alias network.httpdump="sudo tcpdump -i wlo1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Utils
alias clean.node="rm -rf node_modules"
alias clean.npm="clean.node && npm cache verify && npm install"
alias clean.yarn="clean.node && yarn"
alias json="python -mjson.tool"
weather() { curl -4 wttr.in/${1:-charenton} }

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"
