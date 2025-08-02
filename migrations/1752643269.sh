echo "Add new matte black theme"

if [[ ! -L "~/.config/gnk/themes/matte-black" ]]; then
  ln -snf ~/.local/share/gnk/themes/matte-black ~/.config/gnk/themes/
fi
