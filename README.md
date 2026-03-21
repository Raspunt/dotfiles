# Dotfiles

A collection of personal Linux dotfiles for shell, terminal, window managers, status bar, launcher, and GTK themes.

## Contents

- **Alacritty**
- **Fish**
- **Fuzzel**
- **Hyprland**
- **i3**
- **Niri**
- **Waybar**
- home files (`.bashrc`, `.zshrc`, `.xinitrc`)
- **Tokyonight** GTK/Cinnamon/GNOME Shell themes

## Repository Structure

```text
.
├── config/
│   ├── alacritty/
│   │   └── alacritty.toml
│   ├── fish/
│   │   ├── completions/
│   │   ├── conf.d/
│   │   ├── functions/
│   │   ├── themes/
│   │   ├── config.fish
│   │   ├── fish_plugins
│   │   └── fish_variables
│   ├── fuzzel/
│   │   └── fuzzel.ini
│   ├── hypr/
│   │   ├── scripts/
│   │   ├── autostart.conf
│   │   ├── environments.conf
│   │   ├── hyprland.conf
│   │   └── keybinds.conf
│   ├── i3/
│   │   └── config
│   ├── niri/
│   │   ├── scripts/
│   │   └── config.kdl
│   └── waybar/
│       ├── config-hyprland
│       ├── config-niri
│       └── style.css
├── home/
│   ├── .bashrc
│   ├── .xinitrc
│   └── .zshrc
├── themes/
│   ├── Tokyonight-Dark/
│   ├── Tokyonight-Dark-hdpi/
│   ├── Tokyonight-Dark-xhdpi/
│   ├── Tokyonight-Light/
│   ├── Tokyonight-Light-hdpi/
│   └── Tokyonight-Light-xhdpi/
└── install.py
```

## Directory Overview

### `config/`
Application configuration files that are installed into `~/.config/`.

- **alacritty/** — Alacritty terminal configuration
- **fish/** — Fish shell config, plugins, functions, and completions
- **fuzzel/** — Fuzzel launcher configuration
- **hypr/** — Hyprland configuration and helper scripts
- **i3/** — i3 window manager configuration
- **niri/** — Niri configuration and helper scripts
- **waybar/** — Waybar configuration for Hyprland and Niri

### `home/`
Files that are copied directly into the home directory:

- `.bashrc`
- `.zshrc`
- `.xinitrc`

### `themes/`
Tokyonight themes in dark and light variants, including `hdpi` and `xhdpi` versions.

Theme support includes:

- GTK 2
- GTK 3
- GTK 4
- GNOME Shell
- Cinnamon
- Metacity
- Xfwm4
- Plank

## Installation

The repository includes an `install.py` script that copies:

- `config/*` → `~/.config/`
- `home/*` → `~/`
- `themes/*` → `~/.themes/`

Run:

```bash
python3 install.py
```

## Manual Installation

If needed, files can be installed manually:

```bash
mkdir -p ~/.config ~/.themes
cp -r config/* ~/.config/
cp -r themes/* ~/.themes/
cp home/.bashrc home/.zshrc home/.xinitrc ~/
```

## Notes

- These dotfiles are intended for Linux.
- Some configurations depend on external applications and utilities being installed.
- After installation, restarting the shell, Waybar, or window manager may be required.

## License

Use as you like.

