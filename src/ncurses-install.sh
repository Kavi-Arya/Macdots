#!/bin/bash

# Ensure the ncurses library is available
if ! command -v dialog &>/dev/null; then
  echo "[ERROR] 'dialog' is required but not installed. Install it with 'brew install dialog' or 'sudo apt-get install dialog'."
  exit 1
fi

# Logging function for better output visibility
log() {
  echo "[INFO] $1"
}

# Function to show progress during execution
show_progress() {
  dialog --infobox "$1" 5 50
  sleep 1
}

# Function to install Brew
install_brew() {
  show_progress "Installing Homebrew..."
  log "Installing Homebrew..."
  if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    log "Homebrew installation completed."
    dialog --msgbox "Homebrew installation completed." 6 50
  else
    log "Homebrew is already installed."
    dialog --msgbox "Homebrew is already installed." 6 50
  fi
}

# Function to install Nix
install_nix() {
  show_progress "Installing Nix..."
  log "Installing Nix..."
  if ! command -v nix &>/dev/null; then
    sh | curl -L https://nixos.org/nix/install
    log "Nix installation completed."
    dialog --msgbox "Nix installation completed." 6 50
  else
    log "Nix is already installed."
    dialog --msgbox "Nix is already installed." 6 50
  fi
}

# Function to clone Macdots
clone_macdots() {
  show_progress "Cloning Macdots repository..."
  log "Cloning Macdots repository..."
  mkdir -p "$HOME/.clones"
  if [ ! -d "$HOME/.clones/Macdots" ]; then
    git clone --depth 1 "https://github.com/Kavi-Arya/Macdots" "$HOME/.clones/Macdots"
    log "Macdots repository cloned successfully."
    dialog --msgbox "Macdots repository cloned successfully." 6 50
  else
    log "Macdots repository already exists."
    dialog --msgbox "Macdots repository already exists." 6 50
  fi
}

# Function to apply macOS defaults
apply_macos_defaults() {
  show_progress "Applying macOS defaults..."
  log "Applying macOS defaults..."
  defaults write com.apple.dock autohide -bool true
  defaults write com.apple.dock "mru-spaces" -bool "false"
  defaults write com.apple.Finder AppleShowAllFiles -bool true
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
  log "macOS defaults applied successfully."
  dialog --msgbox "macOS defaults applied successfully." 6 50
}

# Function to install packages from Brew lists
install_brew_packages() {
  show_progress "Installing Brew packages..."
  log "Installing Brew packages..."
  pkgs_file="$HOME/.clones/Macdots/src/pkgs.txt"
  casks_file="$HOME/.clones/Macdots/src/casks.txt"

  if [[ -f "$pkgs_file" ]]; then
    xargs brew install < "$pkgs_file"
    log "Brew packages installed successfully."
    dialog --msgbox "Brew packages installed successfully." 6 50
  else
    log "Package file $pkgs_file not found. Skipping."
    dialog --msgbox "Package file $pkgs_file not found. Skipping." 6 50
  fi

  if [[ -f "$casks_file" ]]; then
    xargs brew install --cask < "$casks_file"
    log "Brew cask packages installed successfully."
    dialog --msgbox "Brew cask packages installed successfully." 6 50
  else
    log "Cask file $casks_file not found. Skipping."
    dialog --msgbox "Cask file $casks_file not found. Skipping." 6 50
  fi
}

# Function to run setup dotfiles
setup_dotfiles() {
  show_progress "Setting up dotfiles..."
  log "Setting up dotfiles..."
  mkdir -p "$HOME/.config"
  cp -r "$HOME/.clones/Macdots/dotfiles" "$HOME"
  cd "$HOME/dotfiles" || exit
  stow .
  log "Dotfiles setup completed successfully."
  dialog --msgbox "Dotfiles setup completed successfully." 6 50
}

# Function to start services
start_services() {
  show_progress "Starting services..."
  log "Starting services..."
  if command -v sketchybar &>/dev/null; then
    brew services restart sketchybar
  fi
  if command -v yabai &>/dev/null; then
    yabai --start-service
  fi
  if command -v skhd &>/dev/null; then
    skhd --start-service
  fi
  log "Services started successfully."
  dialog --msgbox "Services started successfully." 6 50
}

# Main ncurses interface
while true; do
  choice=$(dialog --clear \
    --title "Mac Setup Script" \
    --menu "Choose an option:" 15 50 6 \
    1 "Install Homebrew" \
    2 "Install Nix" \
    3 "Clone Macdots Repository" \
    4 "Set Up Dotfiles" \
    5 "Install Brew Packages" \
    6 "Apply macOS Defaults" \
    7 "Start Services" \
    8 "Exit" \
    3>&1 1>&2 2>&3)

  clear
  case $choice in
    1)
      install_brew
      ;;
    2)
      install_nix
      ;;
    3)
      clone_macdots
      ;;
    4)
      setup_dotfiles
      ;;
    5)
      install_brew_packages
      ;;
    6)
      apply_macos_defaults
      ;;
    7)
      start_services
      ;;
    8)
      break
      ;;
    *)
      log "Invalid option. Please try again."
      ;;
  esac

done

log "Setup script completed successfully!"

