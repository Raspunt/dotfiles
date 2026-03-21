# Dotfiles

This repository contains configuration files and themes for various applications and environments. It is designed to help set up a consistent development environment across different systems.

## Project Structure

- **config/**: Contains configuration files for various applications.
  - **alacritty/**: Configuration for the Alacritty terminal emulator.
    - `alacritty.toml`: Main configuration file for Alacritty.
  - **fish/**: Configuration files for the Fish shell.
    - `config.fish`: Main configuration file for Fish.
    - `fish_plugins`: List of Fish plugins.
    - `fish_variables`: Fish shell variables.
    - **completions/**: Custom completions for Fish.
    - **conf.d/**: Additional configuration files for Fish.
    - **functions/**: Custom functions for Fish.
    - **themes/**: Themes for the Fish shell.
  - **hypr/**: Configuration files for the Hyprland window manager.
    - `autostart.conf`: Configuration for autostart applications.
    - `environments.conf`: Environment settings.
    - `hyprland.conf`: Main configuration file for Hyprland.
    - `keybinds.conf`: Keybindings for Hyprland.
    - **scripts/**: Custom scripts for Hyprland.
  - **i3/**: Configuration for the i3 window manager.
    - `config`: Main configuration file for i3.
  - **niri/**: Configuration files for the Niri window manager.
    - `config.kdl`: Main configuration file for Niri.
    - **scripts/**: Custom scripts for Niri.

- **home/**: Contains personal configuration files for the user's home directory.
  - `.bashrc`: Configuration file for the Bash shell.
  - `.zshrc`: Configuration file for the Zsh shell.

- **themes/**: Contains themes for various desktop environments.
  - `Tokyonight-Dark/`: Dark theme variant.
  - `Tokyonight-Dark-hdpi/`: High DPI variant of the dark theme.
  - `Tokyonight-Dark-xhdpi/`: Extra high DPI variant of the dark theme.
  - `Tokyonight-Light/`: Light theme variant.
  - `Tokyonight-Light-hdpi/`: High DPI variant of the light theme.
  - `Tokyonight-Light-xhdpi/`: Extra high DPI variant of the light theme.

- **install.py**: A Python script to automate the installation of dotfiles to the appropriate locations in the user's home directory.

## Installation

To install the dotfiles, run the following command:

```bash
python3 install.py
```

This script will copy the configuration files to the appropriate locations in your home directory, including:

- `~/.config/` for configuration files.
- `~/` for home directory files.
- `~/.themes/` for theme files.

## Usage

After installation, you may need to restart your terminal or window manager for the changes to take effect. Customize the configuration files as needed to suit your preferences.

