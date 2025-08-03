#!/bin/bash

vendor=$(cat /sys/devices/virtual/dmi/id/sys_vendor 2>/dev/null)
model=$(cat /sys/devices/virtual/dmi/id/product_name 2>/dev/null)

# Define devices that need intertouch disabled
# Format: "VENDOR|MODEL"
DEVICES_NEEDING_PATCH=(
    "LENOVO|20SES0FK00"        # Lenovo 11e Yoga Gen 6
    "LENOVO|20QF0001US"        # ThinkPad X1 Yoga Gen 4
)

# Check if current device needs patching
device_needs_patch=false
for device in "${DEVICES_NEEDING_PATCH[@]}"; do
    device_vendor="${device%|*}"
    device_model="${device#*|}"
    
    if [[ "$vendor" == "$device_vendor" && "$model" == "$device_model" ]]; then
        echo "Detected $vendor $model; disabling intertouch"
        device_needs_patch=true
        break
    fi
done

if [[ "$device_needs_patch" != "true" ]]; then
    exit 0
fi

# Append psmouse.synaptics_intertouch=0 kernel param to systemd-boot entries if not present
if [ -d "/boot/loader/entries" ]; then
  for entry in /boot/loader/entries/*.conf; do
    # Skip fallback entries
    if [[ "$(basename "$entry")" == *"fallback"* ]]; then
      continue
    fi

    if grep -q "psmouse.synaptics_intertouch=0" "$entry"; then
      echo "Already patched: $entry"
      continue
    fi

    sudo sed -i '/^options/ s/$/ psmouse.synaptics_intertouch=0/' "$entry"
    echo "Patched: $entry"
  done
else
  echo "Systemd-boot entries not found. Manual intervention required."
fi

