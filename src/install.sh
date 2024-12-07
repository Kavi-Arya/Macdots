#!/bin/bash

# echo '---------Installing Brew---------'
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# brew install git

# echo '---------Installing Nix---------'
# sh <(curl -L https://nixos.org/nix/install)

movingShit(){
  echo '---------Runing Moving Shit---------'
  mkdir "$HOME/.config"
  mkdir "$HOME/.clones"
  git clone --dept https://github.com/Kavi-Arya/Macdots.git "$HOME/.clones/Macdots"
  cp -r "$HOME/.clones/Macdots/.config/*" "$HOME/.config/"
  printf "\n"
} 

brewinstall(){
  echo '---------Brew Install---------'
  xargs brew install < "$HOME/.clones/Macdots/src/pkgs.txt"
  xargs brew install < "$HOME/.clones/Macdots/src/casks.txt"
  printf "\n"
}

shellColor(){
  echo '---------Runing Shell Color script---------'
  cd "$HOME/.clones/Macdots/src/shell-color-scripts" || exit
  sudo make install
  printf "\n"
  cd || exit
}

sysSettings(){
  echo '---------Changing macOS defaults...---------'
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
  echo '---------Starting services---------'
  brew services restart sketchybar
  yabai --start-service
  skhd --start-service
}

# movingShit
# brewinstall
# shellColor
# Services
# sysSettings
