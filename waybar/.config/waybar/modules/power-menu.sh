#!/bin/bash

set -e

DISPLAY_NAMES=(Lock Logout 'Power Off' Reboot)
COMMANDS=('swaylock -l -i /home/matthew/.config/backgrounds/lockscreen/window-blur-lock.jpg' 'niri msg action quit' 'systemctl poweroff' 'systemctl reboot')
ICON_PATHS=(
  /usr/share/icons/Adwaita/symbolic/status/system-lock-screen-symbolic.svg
  /usr/share/icons/Adwaita/symbolic/actions/system-log-out-symbolic.svg
  /usr/share/icons/Adwaita/symbolic/actions/system-shutdown-symbolic.svg
  /usr/share/icons/Adwaita/symbolic/actions/system-reboot-symbolic.svg
  )

MENU_ITEMS=()
for i in "${!DISPLAY_NAMES[@]}"; do
  MENU_ITEMS+=("img:${ICON_PATHS[i]}:text:${DISPLAY_NAMES[i]}")
done

CHOICE=$(printf '%s\n' "${MENU_ITEMS[@]}" | wofi --conf ~/.config/wofi/power_menu.conf)
# CHOICE=$(printf '%s\n' "${MENU_ITEMS[@]}" | wofi --dmenu)

# Extract label from `text:...`
SELECTED_NAME="${CHOICE#*:text:}"

# Match selection and run command
for i in "${!DISPLAY_NAMES[@]}"; do
  if [[ "${DISPLAY_NAMES[i]}" == "$SELECTED_NAME" ]]; then
    eval "${COMMANDS[i]}"
    break
  fi
done

