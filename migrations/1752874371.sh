echo "Add Catppuccin Latte light theme"
if [[ ! -L "~/.config/gnk/themes/catppuccin-latte" ]]; then
  ln -snf ~/.local/share/gnk/themes/catppuccin-latte ~/.config/gnk/themes/
fi
