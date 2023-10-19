#!/usr/bin/env python

from common import *

import json

GLYPHNAMES = DIR/"glyphnames.json"
GLYPHURL = "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/glyphnames.json"
ensure_file(GLYPHNAMES, GLYPHURL)

with open(GLYPHNAMES) as f:
    icons = json.load(f)

lines = []
for name, icon in icons.items():
    if name == "METADATA":
        continue
    lines.append(f"{name:<30} {icon['char']}")
out = dmenu('\n'.join(lines))
out = list(
    map(str.strip, filter(lambda x: x != '', out.split(' ')))
)

clip(out[1])
