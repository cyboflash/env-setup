#!/usr/bin/env bash
echo "Verify python2 configuration is in /usr/lib/python2.7/config-x86_64-linux-gnu"
echo "If it is not then stop the script and change --with-python-config-dir option"
echo "Verify python3 configuration is in /usr/lib/python3.7m/config-3.7m-x86_64-linux-gnu"
echo "If it is not then stop the scrtop and change --with-python3-config-dir"
read -n 1 -p "Press Enter to continue or Ctrl-C to stop"

# Create installation directory
mkdir -p $HOME/.local/vim

#install vim
cd /tmp
if [ ! -d /tmp/vim ]; then
    git clone https://github.com/vim/vim.git
else
    git pull
fi
cd vim
./configure --with-features=huge \
        --enable-multibyte \
	    --enable-rubyinterp=yes \
	    --enable-pythoninterp=yes \
	    --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
	    --enable-python3interp=yes \
	    --with-python3-config-dir=/usr/lib/python3.7m/config-x86_64-linux-gnu \
	    --enable-perlinterp=yes \
	    --enable-luainterp=yes \
        --enable-gui=gtk2 \
        --enable-cscope \
	    --prefix=$HOME/.local/opt/vim
make
make install

# Set vim as your default editor with update-alternatives
sudo update-alternatives --install /usr/bin/editor editor $HOME/.local/opt/vim/bin/vim 1
sudo update-alternatives --set editor $HOME/.local/opt/vim/bin/vim
sudo update-alternatives --install /usr/bin/vi vi $HOME/.local/opt/vim/bin/vim 1
sudo update-alternatives --set vi $HOME/.local/opt/vim/bin/vim
sudo update-alternatives --install /usr/bin/vim vim $HOME/.local/opt/vim/bin/vim 1
sudo update-alternatives --set vim $HOME/.local/opt/vim/bin/vim

# install Vundle
if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
else
    git pull
fi

vim -c PluginInstall -c q -c q

# Build YouCompleteMe
cd $HOME/.vim/bundle/YouCompleteMe
python3 install.py \
    --clang-completer \
    --cs-completer

# Build color_coded
cd ~/.vim/bundle/color_coded
rm -f CMakeCache.txt
if [ ! -d build ]; then
    mkdir build
fi
cd build
cmake .. -DDOWNLOAD_CLANG=0 -DLLVM_CONFIG=/usr/bin/llvm-config-8 -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON
make && make install
make clean
