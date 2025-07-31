#!/bin/bash

# Use dark mode for QT apps too (like kdenlive)
if ! yay -Q kvantum-qt5 &>/dev/null; then
  yay -S --noconfirm kvantum-qt5
fi

# Prefer dark mode everything
if ! yay -Q gnome-themes-extra &>/dev/null; then
  yay -S --noconfirm gnome-themes-extra # Adds Adwaita-dark theme
fi

gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

# Setup theme links
mkdir -p ~/.config/gnk/themes
for f in ~/.local/share/gnk/themes/*; do ln -nfs "$f" ~/.config/gnk/themes/; done

# Set initial theme
mkdir -p ~/.config/gnk/current
ln -snf ~/.config/gnk/themes/tokyo-night ~/.config/gnk/current/theme
ln -snf ~/.config/gnk/current/theme/backgrounds/1-scenery-pink-lakeside-sunset-lake-landscape-scenic-panorama-7680x3215-144.png ~/.config/gnk/current/background

# Set specific app links for current theme
ln -snf ~/.config/gnk/current/theme/neovim.lua ~/.config/nvim/lua/plugins/theme.lua

mkdir -p ~/.config/btop/themes
ln -snf ~/.config/gnk/current/theme/btop.theme ~/.config/btop/themes/current.theme

mkdir -p ~/.config/mako
ln -snf ~/.config/gnk/current/theme/mako.ini ~/.config/mako/config
