echo "Adding GNK version info to fastfetch"
if ! grep -q "gnk" ~/.config/fastfetch/config.jsonc; then
  cp ~/.local/share/gnk/config/fastfetch/config.jsonc ~/.config/fastfetch/
fi

