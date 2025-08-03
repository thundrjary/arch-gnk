#!/bin/bash

set -e

# Check if running Wayland
if [ -z "$WAYLAND_DISPLAY" ]; then
    echo "Warning: WAYLAND_DISPLAY not set. Waydroid requires Wayland."
fi

# Install waydroid and python-pip
echo "Installing waydroid and dependencies..."
if ! yay -S --noconfirm waydroid python-pip; then
    echo "Error: Failed to install packages"
    exit 1
fi

# Enable and start service
echo "Enabling waydroid service..."
if ! sudo systemctl enable --now waydroid-container; then
    echo "Error: Failed to enable waydroid-container service"
    exit 1
fi

# Initialize waydroid
echo "Initializing waydroid..."
if ! waydroid init; then
    echo "Error: Failed to initialize waydroid"
    exit 1
fi

# Install waydroid_script for ARM support
echo "Installing waydroid_script for ARM support..."
if ! pip install git+https://github.com/casualsnek/waydroid_script; then
    echo "Error: Failed to install waydroid_script"
    exit 1
fi

# Install libhoudini for ARM app compatibility
echo "Installing libhoudini for ARM apps..."
if ! sudo python -m waydroid_script install libhoudini; then
    echo "Error: Failed to install libhoudini"
    exit 1
fi

echo "Installation complete with ARM support. Run 'waydroid session start' then 'waydroid show-full-ui' to use."
