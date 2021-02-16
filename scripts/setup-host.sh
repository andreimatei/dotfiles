#!/bin/sh
set -eux

mkdir -p ~/src

# Vim swap dir.
mkdir -p ~/.swp

# !!! install Vundle for Vim
# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# !!! if ui, sudo apt-get install wmctrl

# !!! ccache, bazel, gcloud
# sudo apt-get install ccache
# snap install google-cloud-sdk --classic

DOTFILES_DIR=~/dotfiles

clone_or_pull() {
  local remote=$1
  local dir=$2
  local branch_arg=""
  local branch_name=""
  if [ ! -z ${3:-} ]; then
    branch_arg="--branch $3"
    branch_name=$3
  fi
  if [ ! -d $dir ]; then
    echo "Cloning $remote"
    git clone $branch_arg $remote $dir
  else
    echo "Updating dotfiles"
    git --git-dir=$dir/.git pull origin $branch_name
  fi
}

clone_or_pull https://github.com/andreimatei/dotfiles.git ~/dotfiles

install_symlink() {
  file=$1
  if [ -L ~/$file ]; then
    echo "~$file alredy a symlink. Not touching." 
    return
  fi
  if [ -f ~/$file ]; then
    echo "Backing up $file to $file.bk"
    mv ~/$file ~/$file.bk
  fi
  echo "Installing ~/$file"
  ln -s ~/dotfiles/dotfiles/$file ~/$file
}

# Create symlinks to all the dotfiles.
for file in $(find ~/dotfiles/dotfiles -type f -printf "%f "); do
  install_symlink $file
done

# Install zsh and make it the login shell.
sudo apt install zsh
chsh -s /usr/bin/zsh

# Install Liquidprompt.
# I'm cloning v1.12 instead of the `stable` branch because of https://github.com/nojhan/liquidprompt/issues/658.
clone_or_pull https://github.com/nojhan/liquidprompt.git ~/src/liquidprompt v1.12.0

# Install Oh My Zsh.
ZSH=~/src/oh-my-zsh RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true

# Install zsh-autosuggestions as a oh-my-zsh plugin.
clone_or_pull https://github.com/zsh-users/zsh-autosuggestions ~/src/oh-my-zsh/custom/plugins/zsh-autosuggestions

dconf load / < ~/dotfiles/config/linux/dconf.backup

# Start zsh.
zsh --login
