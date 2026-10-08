# Dotfiles

A collection of personal Linux dotfiles for shell, terminal, window managers, status bar, launcher, and GTK themes.

## Contents

- **Alacritty** — terminal emulator
- **Fish** — shell configuration, plugins, functions, completions
- **Fuzzel** — application launcher
- **Hyprland** — Wayland compositor configuration (Lua-based, via hyprlua) and scripts
- **i3** — X11 tiling window manager
- **Labwc** — Wayland stacking compositor (wlroots-based)
- **Mango** — MangoHud overlay configuration
- **Niri** — scrollable-tiling Wayland compositor
- **Waybar** — status bar for Hyprland, Niri, and Labwc
- **Home files** — `.bashrc`, `.zshrc`, `.xinitrc`
- **Tokyonight** — GTK/Cinnamon/GNOME Shell themes (Dark & Light, hdpi, xhdpi)

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
│   │   │   ├── randwall
│   │   │   ├── restart-waybar
│   │   │   └── set_wall
│   │   ├── appearance.lua
│   │   ├── autostart.lua
│   │   ├── env.lua
│   │   ├── hyprland.lua
│   │   ├── input.lua
│   │   ├── keybinds.lua
│   │   ├── monitors.lua
│   │   └── rules.lua
│   ├── i3/
│   │   └── config
│   ├── labwc/
│   │   ├── scripts/
│   │   │   └── restart-waybar
│   │   ├── autostart
│   │   ├── environment
│   │   ├── menu.xml
│   │   └── rc.xml
│   ├── mango/
│   │   └── config.conf
│   ├── niri/
│   │   ├── scripts/
│   │   │   ├── restart_screen_share
│   │   │   └── set_wallpets
│   │   └── config.kdl
│   └── waybar/
│       ├── config-hyprland
│       ├── config-labwc
│       ├── config-niri
│       ├── scripts/
│       │   └── gpu.sh
│       ├── style-hyprland.css
│       ├── style-labwc.css
│       └── style-niri.css
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
├── install.py
└── README.md
```

## Directory Overview

### `config/`
Application configuration files installed into `~/.config/`.

| Directory     | Description                                              |
|---------------|----------------------------------------------------------|
| `alacritty/`  | Alacritty terminal configuration                         |
| `fish/`       | Fish shell config, plugins, functions, and completions   |
| `fuzzel/`     | Fuzzel launcher configuration                            |
| `hypr/`       | Hyprland configuration (Lua, via hyprlua) and helper scripts |
| `i3/`         | i3 window manager configuration                          |
| `labwc/`      | Labwc configuration and helper scripts                   |
| `mango/`      | MangoHud configuration                                   |
| `niri/`       | Niri configuration and helper scripts                    |
| `waybar/`     | Waybar configuration for Hyprland, Niri, and Labwc        |

### `home/`
Files copied directly into the home directory (`~/`):

- `.bashrc`
- `.zshrc`
- `.xinitrc`

### `themes/`
Tokyonight themes in Dark and Light variants with hdpi and xhdpi versions.

Supported environments:

| Component    |
|--------------|
| GTK 2        |
| GTK 3        |
| GTK 4        |
| GNOME Shell  |
| Cinnamon     |
| Metacity     |
| Xfwm4        |
| Plank        |
| Openbox      |

## Installation

Run the included `install.py` script:

```bash
python3 install.py
```

This copies:

| Source       | Destination    |
|--------------|----------------|
| `config/*`   | `~/.config/`   |
| `home/*`     | `~/`           |
| `themes/*`   | `~/.themes/`   |

## Manual Installation

```bash
mkdir -p ~/.config ~/.themes
cp -r config/* ~/.config/
cp -r themes/* ~/.themes/
cp home/.bashrc home/.zshrc home/.xinitrc ~/
```

## Notes

- Intended for Linux only.
- Some configurations require external applications and utilities to be installed.
- After installation, restart the shell, Waybar, or window manager as needed.

## License

Use as you like.

