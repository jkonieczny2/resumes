#!/bin/bash
set -e

brew install --cask mactex

eval "$(/usr/libexec/path_helper)"

sudo tlmgr update --self
sudo tlmgr install moderncv fontawesome5 collection-fontsrecommended
