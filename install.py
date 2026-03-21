#!/usr/bin/env python3
import shutil
from pathlib import Path

home = Path.home()
repo = Path(__file__).parent

# config/* -> ~/.config/
dst = home / ".config"
dst.mkdir(exist_ok=True)
for src in (repo / "config").iterdir():
    shutil.copytree(src, dst / src.name, dirs_exist_ok=True)

# home/* -> ~/
for src in (repo / "home").iterdir():
    shutil.copytree(src, home / src.name, dirs_exist_ok=True)

# themes/* -> ~/.themes/
dst = home / ".themes"
dst.mkdir(exist_ok=True)
for src in (repo / "themes").iterdir():
    shutil.copytree(src, dst / src.name, dirs_exist_ok=True)