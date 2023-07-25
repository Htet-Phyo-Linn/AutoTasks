#!/usr/bin/bash

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


#config
apt install fonts-powerline


#fonts for terminal
rm -rf ~/.local/share/fonts

mkdir ~/.local/share/fonts

wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf

mv *.ttf ~/.local/share/fonts/


#change config
vim .zshrc
#powerlevel10k/powerlevel10k

p10k configure
