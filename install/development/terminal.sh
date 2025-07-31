#!/bin/bash

yay -S --noconfirm --needed \
  wget curl unzip inetutils impala \
  fd eza fzf ripgrep zoxide bat jq \ #TODO-JDL: jq not needed, others fine
  wl-clipboard fastfetch btop \
  man tldr less whois plocate bash-completion \
  alacritty #TODO-JDL: consider changing to kitty
