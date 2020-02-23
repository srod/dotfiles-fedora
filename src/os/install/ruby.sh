#!/bin/bash

declare -r RUBY_VERSION="2.7.0"
# declare -r LOCAL_SHELL_CONFIG_FILE="$HOME/.bash.local"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# add_rbenv_configs() {

#     declare -r CONFIGS="
# # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# # Rbenv
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"
# export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
# "

#     # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#     execute \
#         "printf '%s' '$CONFIGS' >> $LOCAL_SHELL_CONFIG_FILE \
#             && . $LOCAL_SHELL_CONFIG_FILE" \
#         "rbenv (update $LOCAL_SHELL_CONFIG_FILE)"

# }

install_ruby() {

    # execute \
    #     "git clone https://github.com/rbenv/rbenv.git ~/.rbenv && cd ~/.rbenv && src/configure && make -C src" \
    #     "Rbenv"

    # execute \
    #     "git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build" \
    #     "Ruby-build"
    
    # add_rbenv_configs

    # execute "rbenv install '$RUBY_VERSION'" "Install"
    # execute "rbenv global '$RUBY_VERSION'" "Set global '$RUBY_VERSION'"
    # # execute ". $LOCAL_SHELL_CONFIG_FILE" "Load env"
    # execute "gem update --system" "Update system"
    # execute "gem update" "Update"

    sudo apt-get install -y zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev

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
