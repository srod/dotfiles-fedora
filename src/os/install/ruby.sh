#!/bin/bash

declare -r RUBY_VERSION="2.7.1"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_ruby() {

    sudo dnf install -y gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison sqlite-devel

    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    cd ~/.rbenv && src/configure && make -C src && cd - || return
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

    export PATH="$HOME/.rbenv/bin:$PATH"
    export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
    export PATH="$HOME/.rbenv/shims:$PATH"
    eval "$(rbenv init -)"

    rbenv install $RUBY_VERSION
    rbenv global $RUBY_VERSION

    gem update --system
    gem update

    cd $DOTFILES/src/os

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_blue "\n   Ruby\n\n"

    install_ruby

}

main
