echo "Add the new ristretto theme as an option"

if [[ ! -L ~/.config/gnk/themes/ristretto ]]; then
  ln -nfs ~/.local/share/gnk/themes/ristretto ~/.config/gnk/themes/
fi
