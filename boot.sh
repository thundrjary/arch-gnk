#!/bin/bash

ansi_art='
 ██████╗ ███████╗███╗   ██╗████████╗██╗     ███████╗       ██╗       ██╗  ██╗██╗███╗   ██╗██████╗ 
██╔════╝ ██╔════╝████╗  ██║╚══██╔══╝██║     ██╔════╝       ██║       ██║ ██╔╝██║████╗  ██║██╔══██╗
██║  ███╗█████╗  ██╔██╗ ██║   ██║   ██║     █████╗      ████████╗    █████╔╝ ██║██╔██╗ ██║██║  ██║
██║   ██║██╔══╝  ██║╚██╗██║   ██║   ██║     ██╔══╝      ██╔═██╔═╝    ██╔═██╗ ██║██║╚██╗██║██║  ██║
╚██████╔╝███████╗██║ ╚████║   ██║   ███████╗███████╗    ██████║      ██║  ██╗██║██║ ╚████║██████╔╝
 ╚═════╝ ╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚══════╝    ╚═════╝      ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚═════╝ '

clear
echo -e "\n$ansi_art\n"

sudo pacman -Sy --noconfirm --needed git

echo -e "\nCloning GNK..."
rm -rf ~/.local/share/gnk/
git clone https://github.com/thundrjary/gentle-and-kind-arch.git ~/.local/share/gnk >/dev/null

# Use custom branch if instructed
if [[ -n "$GNK_REF" ]]; then
  echo -e "\eUsing branch: $GNK_REF"
  cd ~/.local/share/gnk
  git fetch origin "${GNK_REF}" && git checkout "${GNK_REF}"
  cd -
fi

echo -e "\nInstallation starting..."
source ~/.local/share/gnk/install.sh
