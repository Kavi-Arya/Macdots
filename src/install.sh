#!/bin/sh

# installing brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

movingShit(){
  echo '---------Runing Moving Shit---------'
  mkdir "$HOME/.config"
  cp -r "$HOME/.clones/Macdots/.config/*" "$HOME/.config/"
  printf "\n"
} 

brewinstall(){
  echo '---------Brew Install---------'
  xargs brew install < ./pkgs.txt
  xargs brew install < ./casks.pkgs
  brew install 
  printf "\n"
}

shellColor(){
  echo '---------Runing Shell Color script---------'
  cd "$HOME/.clones/Macdots/src/shell-color-scripts" || exit
  sudo make install
  printf "\n"
}

sysSettings(){
  echo '---------Changing macOS defaults...---------'
  defaultsWrite="defaults write"
  $defaultsWrite com.apple.NetworkBrowser BrowseAllInterfaces 1
  $defaultsWrite com.apple.desktopservices DSDontWriteNetworkStores -bool true
  $defaultsWrite com.apple.spaces spans-displays -bool false
  $defaultsWrite com.apple.dock autohide -bool true
  $defaultsWrite com.apple.dock "mru-spaces" -bool "false"
  $defaultsWrite NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
  $defaultsWrite com.apple.LaunchServices LSQuarantine -bool false
  $defaultsWrite NSGlobalDomain com.apple.swipescrolldirection -bool false
  $defaultsWrite NSGlobalDomain KeyRepeat -int 1
  $defaultsWrite NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
  $defaultsWrite NSGlobalDomain AppleShowAllExtensions -bool true
  $defaultsWrite NSGlobalDomain _HIHideMenuBar -bool true
  $defaultsWrite com.apple.screencapture location -string "$HOME/Desktop"
  $defaultsWrite com.apple.screencapture disable-shadow -bool true
  $defaultsWrite com.apple.screencapture type -string "png"
  $defaultsWrite com.apple.finder DisableAllAnimations -bool true
  $defaultsWrite com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
  $defaultsWrite com.apple.finder ShowHardDrivesOnDesktop -bool false
  $defaultsWrite com.apple.finder ShowMountedServersOnDesktop -bool false
  $defaultsWrite com.apple.finder ShowRemovableMediaOnDesktop -bool false
  $defaultsWrite com.apple.Finder AppleShowAllFiles -bool true
  $defaultsWrite com.apple.finder FXDefaultSearchScope -string "SCcf"
  $defaultsWrite com.apple.finder FXEnableExtensionChangeWarning -bool false
  $defaultsWrite com.apple.finder _FXShowPosixPathInTitle -bool true
  $defaultsWrite com.apple.finder FXPreferredViewStyle -string "Nlsv"
  $defaultsWrite com.apple.finder ShowStatusBar -bool false
  $defaultsWrite com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES
  $defaultsWrite com.apple.Safari AutoOpenSafeDownloads -bool false
  $defaultsWrite com.apple.Safari IncludeDevelopMenu -bool true
  $defaultsWrite com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
  $defaultsWrite com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
  $defaultsWrite NSGlobalDomain WebKitDeveloperExtras -bool true
  $defaultsWrite com.apple.mail AddressesIncludeNameOnPasteboard -bool false
  $defaultsWrite -globalDomain AppleAccentColor -bool False
  $defaultsWrite -globalDomain AppleHighlightColor -string "Orange"
  $defaultsWrite -globalDomain AppleAccentColor -bool True
}

Services(){
  echo '---------Starting services---------'
  brew services restart sketchybar
  yabai --start-service
  skhd --start-service
}

movingShit
brewinstall
shellColor
Services
sysSettings
