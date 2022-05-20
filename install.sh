#!/usr/bin/env bash


sudo apt-get update -y
sudo apt-get upgrade -y

# Install ZSH
sudo apt-get install -y vim zsh nano
sudo chsh -s /bin/zsh $USER

# Install and configure Oh My ZSH (if it is not already installed)
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

# Install a plugin for ZSH auto suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git config --global user.name "nooobcoder"
git config --global user.email "suryashi2013@gmail.com"
git config --global user.signingkey F4471868B502ACC037FBF1FB7C2D646CF53E03BD
git config --global commit.gpgsign true  
echo 'pinentry-mode loopback' >> ~/.gnupg/gpg.conf

cat ./.zshrc >> ~/.zshrc
chsh -s $(which zsh)
