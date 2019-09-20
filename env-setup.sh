#!/usr/bin/env bash
git clone https://github.com/cyboflash/dotfiles.git /tmp/dotfiles
mv /tmp/dotfiles .??* $HOME
git submodule update --init --recursive
git submodule update --recursive --remote

if hostnamectl | grep -q Ubuntu; then
    ./remove-apt-vim.sh
    ./install-apt-packages.sh
fi

./install-vim.sh
./configure-tmux.sh
