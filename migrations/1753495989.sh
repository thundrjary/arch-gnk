echo "Allow updating of timezone by right-clicking on the clock (or running gnk-cmd-tzupdate)"
if ! command -v tzupdate &>/dev/null; then
  bash ~/.local/share/gnk/install/config/timezones.sh
  gnk-refresh-waybar
fi
