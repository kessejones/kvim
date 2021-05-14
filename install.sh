#!/bin/bash

GIT_URL="https://github.com/kessejones/kvim.git"
INSTALL_PATH="$HOME/.config/nvim"

run () {
    echo "Instalando"
    git clone $GIT_URL $INSTALL_PATH
    echo "Pronto!"
}

run
