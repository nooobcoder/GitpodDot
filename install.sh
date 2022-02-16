#!/usr/bin/env bash


sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install git -y
sudo apt install python3-pip -y
sudo pip3 install pylint
sudo pip3 install pipenv
sudo pip3 install autopep8
sudo apt-get install openjdk-11-jdk -y
sudo apt install unzip
sudo apt install g++ -y
sudo apt install gcc -y
sudo apt install curl -y
sudo apt install gdb -y
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt install npm -y
sudo apt-get install iputils-ping -y
sudo apt install nodejs -y
sudo apt install npm -y

# Install ZSH
sudo apt-get install -y vim zsh nano
sudo chsh -s /bin/zsh $USER

git config --global user.name "nooobcoder"
git config --global user.email "suryashi2013@gmail.com"
git config --global user.signingkey F4471868B502ACC037FBF1FB7C2D646CF53E03BD
git config --global commit.gpgsign true  

# Install and configure Oh My ZSH (if it is not already installed)
if [ -d "~/.oh-my-zsh" ] 
then
    echo "oh-my-zsh is already installed" 
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    # Append zshrc stuff to end of file
    touch ~/.zshrc # not sure if this will always exist at this point :/
    cat .zshrc >> ~/.zshrc
fi

# Install a plugin for ZSH auto suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

sudo npm i -g nodemon serve eslint typescript npkill

DOTFILES_CLONE_PATH=$HOME/dotfiles
for dotfile in "$DOTFILES_CLONE_PATH/".*; do
  # Skip `..` and '.'
  [[ $dotfile =~ \.{1,2}$ ]] && continue
  # Skip Git related
  [[ $dotfile =~ \.git$ ]] && continue
  [[ $dotfile =~ \.gitignore$ ]] && continue
  [[ $dotfile =~ \.gitattributes$ ]] && continue

  echo "Symlinking $dotfile"
  ln -sf "$dotfile" "$HOME"
done

cat .zshrc >> ~/.zshrc
chsh -s $(which zsh)
