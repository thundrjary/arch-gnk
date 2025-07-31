#!/bin/bash

if [ -z "$GNK_BARE" ]; then
  source ~/.local/share/gnk/default/bash/functions
  web2app "PBS Kids" https://pbskids.org/ https://cdn.jsdelivr.net/gh/thundrjary/gentle-and-kind-arch@master/applications/icons/PBSKids.png
fi
