#!/bin/bash

ZSH="$PWD/.oh-my-zsh"
mkdir -p "$ZSH"

# -- oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ln -s ~/dotfiles/.zshrc ~/.zshrc

cp -R "$PWD/plugins" "$PWD/.oh-my-zsh/custom"

# -- cervesa
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# -- pyenv to switch python env
brew install pyenv
# -- helm for kubernetes
brew install helm
# -- sops for secret encode/decode
brew install sops
# -- tmux cause, duh
brew install tmux
# -- pulumi
brew install pulumi/tap/pulumi
# -- php for brane
brew tap shivammathur/php
brew install shivammathur/php/php@7.4
brew link php@7.4

# -- docker
sudo hdiutil attach Docker.dmg
sudo /Volumes/Docker/Docker.app/Contents/MacOS/install --accept-license
sudo hdiutil detach /Volumes/Docker

# -- aws
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
