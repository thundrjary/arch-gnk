#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

GNK_INSTALL=~/.local/share/gnk/install

# Give people a chance to retry running the installation
catch_errors() {
  echo -e "\n\e[31mGNK installation failed!\e[0m"
  echo "You can retry by running: bash ~/.local/share/gnk/install.sh"
  echo "Get help from the community: https://discord.gg/tXFUdasqhY"
}

trap catch_errors ERR

show_logo() {
  clear
  tte -i ~/.local/share/gnk/logo.txt --frame-rate ${2:-120} ${1:-expand}
  echo
}

show_subtext() {
  echo "$1" | tte --frame-rate ${3:-640} ${2:-wipe}
  echo
}

# Install prerequisites
source $GNK_INSTALL/preflight/aur.sh
source $GNK_INSTALL/preflight/presentation.sh

# Configuration
show_logo beams 240
show_subtext "Let's install GNK! [1/5]"
source $GNK_INSTALL/config/identification.sh
source $GNK_INSTALL/config/config.sh
source $GNK_INSTALL/config/detect-keyboard-layout.sh
source $GNK_INSTALL/config/fix-fkeys.sh
source $GNK_INSTALL/config/network.sh
source $GNK_INSTALL/config/power.sh
source $GNK_INSTALL/config/timezones.sh
source $GNK_INSTALL/config/login.sh
source $GNK_INSTALL/config/nvidia.sh

# Development
show_logo decrypt 920
show_subtext "Installing terminal tools [2/5]"
source $GNK_INSTALL/development/terminal.sh
source $GNK_INSTALL/development/development.sh
source $GNK_INSTALL/development/nvim.sh
source $GNK_INSTALL/development/ruby.sh
source $GNK_INSTALL/development/docker.sh
source $GNK_INSTALL/development/firewall.sh

# Desktop
show_logo slice 60
show_subtext "Installing desktop tools [3/5]"
source $GNK_INSTALL/desktop/desktop.sh
source $GNK_INSTALL/desktop/hyprlandia.sh
source $GNK_INSTALL/desktop/theme.sh
source $GNK_INSTALL/desktop/bluetooth.sh
source $GNK_INSTALL/desktop/asdcontrol.sh
source $GNK_INSTALL/desktop/fonts.sh
source $GNK_INSTALL/desktop/printer.sh

# Apps
show_logo expand
show_subtext "Installing default applications [4/5]"
source $GNK_INSTALL/apps/webapps.sh
source $GNK_INSTALL/apps/xtras.sh
source $GNK_INSTALL/apps/mimetypes.sh

# Updates
show_logo highlight
show_subtext "Updating system packages [5/5]"
sudo updatedb
sudo pacman -Syu --noconfirm

# Reboot
show_logo laseretch 920
show_subtext "You're done! So we'll be rebooting now..."
sleep 2
reboot
