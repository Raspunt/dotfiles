#!/usr/bin/env python3
import re
import shutil
from pathlib import Path

home = Path.home()
repo = Path(__file__).parent

# Nerd Font иконки дистрибутивов для custom/logo в waybar
DISTRO_ICONS = {
    "arch": "",
    "debian": "",
    "ubuntu": "",
    "fedora": "",
    "linuxmint": "",
    "manjaro": "",
    "opensuse": "",
    "nixos": "",
}
DEFAULT_ICON = ""  # Tux


def detect_distro() -> str:
    info = {}
    try:
        for line in Path("/etc/os-release").read_text().splitlines():
            if "=" in line:
                k, v = line.split("=", 1)
                info[k] = v.strip('"')
    except OSError:
        return ""
    ids = [info.get("ID", "")] + info.get("ID_LIKE", "").split()
    for i in ids:
        if i in DISTRO_ICONS:
            return i
    return ids[0] if ids else ""


def copy(src: Path, dst: Path):
    if src.is_dir():
        shutil.copytree(src, dst, dirs_exist_ok=True)
    else:
        dst.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(src, dst)


def set_waybar_logo(icon: str):
    pattern = re.compile(r'("custom/logo"\s*:\s*\{\s*"format"\s*:\s*")\s*[^"\s]*\s*(")')
    for cfg in (home / ".config" / "waybar").glob("config-*"):
        text = cfg.read_text()
        new = pattern.sub(lambda m: f"{m.group(1)} {icon} {m.group(2)}", text)
        if new != text:
            cfg.write_text(new)


# config/* -> ~/.config/
# home/*   -> ~/
# themes/* -> ~/.themes/
for name, dst in (
    ("config", home / ".config"),
    ("home", home),
    ("themes", home / ".themes"),
):
    dst.mkdir(exist_ok=True)
    for src in (repo / name).iterdir():
        copy(src, dst / src.name)

distro = detect_distro()
icon = DISTRO_ICONS.get(distro, DEFAULT_ICON)
set_waybar_logo(icon)
print(f"Distro: {distro or 'unknown'}, waybar logo: U+{ord(icon):04X}")
