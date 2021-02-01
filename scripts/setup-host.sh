#!/bin/sh
set -eux

mkdir -p ~/src

# Clone dotfiles.
# !!! don't fail if dir already exists
git clone https://github.com/andreimatei/dotfiles.git ~/dotfiles

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

# Start zsh.
zsh --login
