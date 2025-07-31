#!/bin/bash

if ! command -v ufw &>/dev/null; then
  yay -S --noconfirm --needed ufw

  # Allow nothing in, everything out
  sudo ufw default deny incoming
  sudo ufw default allow outgoing

  # Allow SSH in
  sudo ufw allow 22/tcp

  # Turn on the firewall
  sudo ufw enable

  # Reload
  sudo ufw reload
fi
