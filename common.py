########## COMMON FUNCTIONS FOR PYTHON ##########

import sys
import os
import subprocess as sp
from pathlib import Path

def getcachedir():
    cachedir = os.environ.get("XDG_CACHE_HOME")
    if not cachedir:
        cachedir = Path.home() / ".cache"
    else:
        cachedir = Path(cachedir)
    cache = cachedir / "dmenu-nerd"
    if not cache.exists():
        cache.mkdir(parents=True)
    return cache


def ensure_file(loc: Path, url):
    if not loc.exists():
        print(
            f"Could not locate {loc}, will attempt to download with curl\n")
        res = sp.run(["curl", url, "-L", "-o", loc])
        if res.returncode != 0:
            print("\nCould not download nerdforn glyph names", file=sys.stderr)
            exit(res.returncode)


def clip(text: str):
    sp.run(["xclip", "-i", "-selection", "c"], text=True, input=text)


DIR = getcachedir()

WIDTH = 2
HEIGHT = 20
FONT_SIZE = 10
FONT = "JetBrainsMono Nerd Font:size=" + str(FONT_SIZE) + ":antialias=true:autohint=true"
# FONT = "Noto Color Emoji:size=" + str(FONT_SIZE) + ":antialias=true:autohint=true"
# FONT = "Noto Color Emoji"
BORDER = 3
INV_PREFIX = False
OPACITY = 0.8

def dmenu(input: str) -> str:
    flags = ["-c", "-l", str(HEIGHT), "-g", str(WIDTH), "-fn", FONT, "-bw",
             str(BORDER), "-o", str(OPACITY)] + (["-x"] if INV_PREFIX else [])
    res = sp.run(["../dmenu/dmenu", *flags], stdout=sp.PIPE, stderr=sp.STDOUT,
                 input=input, encoding="utf8", text=True)
    if res.returncode != 0:
        exit(res.returncode)
    return res.stdout

########## END OF COMMON FUNCTIONS ##########
