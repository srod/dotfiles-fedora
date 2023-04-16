#!/usr/bin/env bash

set -e

zsh_bin=$(grep /zsh$ /etc/shells | tail -1)

if [ "$zsh_bin" != "" ]; then
  ohai "ZSH installed"
else
  ohai "Installing ZSH"
  sudo dnf install -y zsh util-linux-user
  chsh -s $(grep /zsh$ /etc/shells | tail -1)
fi
