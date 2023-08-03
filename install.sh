#!/bin/sh

# installing brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

movingShit(){
  mkdir $HOME/.config
  cp -r $HOME/.clones/Macdots/* $HOME/.config/
} 

brewinstall(){
  brew install keepassxc
  brew install gimp
  brew install qbittorrent
  brew install onlyoffice
  brew install obsidian
  brew install obs
  brew install mpv
  brew install firefox
  brew install flameshot
  brew install alfred
  brew install yt-dlp
  brew install curl
  brew install exa
  brew install ffmpeg
  brew install fzf
  brew install harfbuzz
  brew install imagemagick 
  brew install lf
  brew install lua
  brew install neofetch
  brew install newsboat
  brew install pandoc
  brew install python
  brew install sketchybar
  brew install skhd
  brew install tmux
  brew install tldr
  brew install tree-sitter
  brew install wget
  brew install yabai
  brew install kitty
  brew install unnaturalscrollwheels
  brew install visual-studio-code
  brew install spaceman
  brew install iglace 
}

shellColor(){
  cd $HOME/.clones/Macdots/shell-color-scripts
  sudo make install
}
