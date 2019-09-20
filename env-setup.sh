#!/usr/bin/env bash
if hostnamectl | grep -q Ubuntu; then
    ./remove-apt-vim.sh
    ./install-apt-packages.sh
fi

./install-vim.sh
./configure-tmux.sh
