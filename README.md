# Macdots

A collection of my personal macOS dotfiles and configurations to set up and maintain a streamlined and productive macOS environment.

## Table of Contents

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Customization](#customization)
- [License](#license)

## Features

- Preconfigured shell setup (e.g., Zsh, bash, etc.)
- Aliases and functions for productivity
- Homebrew and package installations
- macOS system defaults adjustments
- Configuration for text editors, terminal emulators, and other tools

## Requirements

- macOS 10.15 (Catalina) or later
- [Homebrew](https://brew.sh/) installed
- [Nix](https://nixos.org/) installed

## Installation

1. Clone the repository:

   ```bash
   git clone --dept 1 https://github.com/Kavi-Arya/Macdots.git ~/.clones/Macdotes.git
   ```

2. Navigate to the repository:

   ```bash
   cd ./Macdots
   ```

3. Run the setup script:

   ```bash
   ./install.sh
   ```

   > **Note:** Make sure the setup script has executable permissions. You can make it executable with `chmod +x install.sh`.

4. Follow the prompts to configure your environment.

## Usage

After installation, you can:

- Use the predefined aliases and functions for everyday tasks.
- Customize the installed configurations by editing the relevant dotfiles (e.g., `.zshrc`, `.bash_profile`, `.vimrc`).
- Add or modify packages in the `Brewfile` to suit your needs.

To apply changes after editing any configuration file, reload the shell:

```bash
source ~/.zshrc
```

## Customization

Feel free to personalize the repository by:

- Adding your own aliases and functions to the shell configuration files.
- Including additional software in the `Brewfile`.
- Adjusting macOS defaults by editing the `macos.sh` script.

## License

This repository is licensed under the [MIT License](LICENSE). Feel free to use and modify it to suit your needs.
