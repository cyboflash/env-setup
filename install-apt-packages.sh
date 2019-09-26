#!/usr/bin/env bash
# Go
sudo add-apt-repository -y ppa:longsleep/golang-backports

# C#
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list

sudo apt update
sudo apt upgrade -y

sudo apt install -y \
    silversearcher-ag \
    net-tools \
    gnome-tweak-tool \
    gnome-shell-extensions \
    clang \
    libtinfo-dev \
    libclang-dev \
    libpthread-workqueue-dev \
    libz-dev \
    xz-utils \
    fonts-powerline\
    tmux \
    gnupg \
    ca-certificates \
    build-essential \
    cmake \
    libncurses-dev \
    libgnome2-dev \
    libgnomeui-dev \
    libgtk2.0-dev \
    libatk1.0-dev \
    libbonoboui2-dev \
    libcairo2-dev \
    libx11-dev \
    libxpm-dev \
    libxt-dev \
    python-dev \
    python3-dev \
    ruby \
    ruby-dev \
    lua5.3 \
    liblua5.3-dev \
    libperl-dev \
    git \
    golang-go \
    default-jdk \
    curl \
    libcurl4-openssl-dev \
    mono-devel

# Javascript
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt install -y \
    nodejs
