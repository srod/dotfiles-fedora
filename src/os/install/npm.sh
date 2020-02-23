#!/bin/bash

install_npm_package() {

    # execute \
    #     ". $HOME/.bash.local \
    #         && npm install --global --silent $2" \
    #     "$1"

    npm install --global $2

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_blue "\n   NPM\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_npm_package "npm (update)" "npm"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_npm_package "npm-check" "npm-check"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_npm_package "serve" "serve"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_npm_package "eslint" "eslint"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_npm_package "@vue/cli" "@vue/cli"


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_npm_package "diff-so-fancy" "diff-so-fancy"

}

main
