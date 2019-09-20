#!/usr/bin/env bash
if hostnamectl | grep -q Ubuntu; then
    ./install-apt-packages.sh
fi

./install-vim.sh
./configure-tmux.sh
