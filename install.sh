#!/usr/bin/env bash


sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install git -y
sudo apt install python3-pip -y
sudo apt-get install openjdk-17-jdk -y
sudo apt install unzip
sudo apt install g++ -y
sudo apt install gcc -y
sudo apt install curl -y
sudo apt install gdb -y
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install nodejs npm iputils-ping -y

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

cat ./.zshrc >> ~/.zshrc
chsh -s $(which zsh)
