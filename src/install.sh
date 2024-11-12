#!/bin/sh

# installing brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

movingShit(){
  echo '---------Runing Moving Shit---------'
  mkdir "$HOME/.config"
  cp -r "$HOME/.clones/Macdots/*" "$HOME/.config/"
  printf "\n"
} 

brewinstall(){
  echo '---------Brew Install---------'
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
  printf "\n"
}

shellColor(){
  echo '---------Runing Shell Color script---------'
  cd "$HOME/.clones/Macdots/shell-color-scripts" || exit
  sudo make install
  printf "\n"
}

sysSettings(){
  printf "Changing macOS defaults..."
  defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
  defaults write com.apple.spaces spans-displays -bool false
  defaults write com.apple.dock autohide -bool true
  defaults write com.apple.dock "mru-spaces" -bool "false"
  defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
  defaults write com.apple.LaunchServices LSQuarantine -bool false
  defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
  defaults write NSGlobalDomain KeyRepeat -int 1
  defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true
  defaults write NSGlobalDomain _HIHideMenuBar -bool true
  defaults write com.apple.screencapture location -string "$HOME/Desktop"
  defaults write com.apple.screencapture disable-shadow -bool true
  defaults write com.apple.screencapture type -string "png"
  defaults write com.apple.finder DisableAllAnimations -bool true
  defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
  defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
  defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
  defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
  defaults write com.apple.Finder AppleShowAllFiles -bool true
  defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
  defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
  defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
  defaults write com.apple.finder ShowStatusBar -bool false
  defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES
  defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
  defaults write com.apple.Safari IncludeDevelopMenu -bool true
  defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
  defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
  defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
  defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
  defaults write -globalDomain AppleAccentColor -bool False
  defaults write -globalDomain AppleHighlightColor -string "Orange"
  defaults write -globalDomain AppleAccentColor -bool True
}

Services(){
  printf "Starting services"
  brew services restart sketchybar
  yabai --start-service
  skhd --start-service
}

movingShit
brewinstall
shellColor
Services
sysSettings
