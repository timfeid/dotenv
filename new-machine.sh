#!/bin/bash
# make sure you run from this folder e.g ./new-machine.sh

ZSH="$PWD/.oh-my-zsh"

# -- oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH/custom/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH/custom/plugins/zsh-syntax-highlighting"
rm -rf ~/.zshrc
ln -s "$PWD/.zshrc" ~/.zshrc

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

# -- git stuff
# git set-upstream for when you get that "There is no tracking information for the current branch." error
git config --global alias.set-upstream '!git branch --set-upstream-to=origin/$(git symbolic-ref --short HEAD)'
# git ac "message" -> git add all files and commit
git config --global alias.ac '!git add -A && git commit -m'
