#!/usr/bin/env bash
git clone https://github.com/cyboflash/dotfiles.git /tmp/dotfiles
mv /tmp/dotfiles/.??* ~/

cat <<EOT >> ~/.bashrc

# Load personal settings
if [ -f ~/.bashrc_personal ]; then
    . ~/.bashrc_personal
fi
EOT

pushd ~/
git submodule update --init --recursive
git submodule update --recursive --remote
popd

if hostnamectl | grep -q Ubuntu; then
    ./remove-apt-vim.sh
    ./install-apt-packages.sh
fi

./install-vim.sh
./configure-tmux.sh
