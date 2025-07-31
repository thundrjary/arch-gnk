#!/bin/bash

if [ -z "$GNK_BARE" ]; then
  yay -S --noconfirm --needed \
    gnome-calculator gnome-keyring \
    kdenlive \
    xournalpp localsend-bin

  # Packages known to be flaky or having key signing issues are run one-by-one
  for pkg in pinta typora; do
    yay -S --noconfirm --needed "$pkg" ||
      echo -e "\e[31mFailed to install $pkg. Continuing without!\e[0m"
  done
fi

# Copy over GNK applications
source ~/.local/share/gnk/bin/gnk-refresh-applications || true
