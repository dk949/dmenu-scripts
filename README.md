# Some dmenu scripts
* List of scripts:
    * sym - allows the user to pick a mathematical symbol from a list
    * screenshot - requires ImageMagick and unclutter. Takes a screenshot, gives it a name if the user did not supply one and stores it in $HOME/Pictures/screenshots

## Installation
```shell
git clone https://github.com/dk949/dmenu-scripts.git
cd dmenu-scripts
make install
```
Note: This is the default method and it assumes that $HOME/.local/bin  exists (it will be created if not) and is on PATH. If you wish to install to a different directory change `DESTDIR` and/or `PREFIX` variables in config.mk.


