#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function update() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
		--exclude "README.md" --exclude "LICENSE.txt" --exclude "brew.sh" \
    --exclude "apt.sh" -avh --no-perms . ~;
	source ~/.bash_profile;
}

function install() {
  # Configure tmux
  if which tmux > /dev/null; then
    tmux source-file ~/.tmux.conf
  fi;

  # Install node and dependencies
  brew install nvm
  cd ~/.config/nvim/
  nvm install node
  npm install
  
  # Install oh my zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  
  # pull down themes
  git clone https://github.com/mbadolato/iTerm2-Color-Schemes.git

  # Install powerline fonts
  git clone https://github.com/powerline/fonts.git --depth=1
  cd fonts
  ./install.sh
  cd ..
  rm -rf fonts
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  update;
	install;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
    if [ "$1" == "--install" -o "$1" == "-I" ]; then
      update;
  		install;
    else
  		update;
    fi;
	fi;
fi;
unset update;
unset install;
