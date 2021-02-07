#!/bin/sh
set -eux

mkdir -p ~/src

# Vim swap dir.
mkdir -p ~/.swp

# !!! install Vundle for Vim
# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# !!! if ui, sudo apt-get install wmctrl
# !!! fix path to the findwindow script in keyboard shortcuts

# !!! ccache, bazel, gcloud
# sudo apt-get install ccache
# snap install google-cloud-sdk --classic

# Clone dotfiles.
# !!! don't fail if dir already exists
git clone https://github.com/andreimatei/dotfiles.git ~/dotfiles
# !!! edit origin remote to use ssh

# Create symlinks to all the dotfiles.
for filename in $(find ~/dotfiles/dotfiles -type f -printf "%f "); do
  echo "installing $filename"
  # !!! make backup copies
  ln -s -f ~/dotfiles/dotfiles/$filename ~/$filename
done

sudo apt install zsh

# Install Liquidprompt.
git clone --branch stable https://github.com/nojhan/liquidprompt.git ~/src/liquidprompt

# Install Oh My Zsh.
ZSH=~/src/oh-my-zsh RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh-autosuggestions as a oh-my-zsh plugin.
git clone https://github.com/zsh-users/zsh-autosuggestions ~/src/oh-my-zsh/custom/plugins/zsh-autosuggestions

# !!!
# dconf load / < config/linux/dconf.backup

# Start zsh.
zsh --login
