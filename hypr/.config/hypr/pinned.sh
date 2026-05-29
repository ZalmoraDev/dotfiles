#!/bin/bash

#USE:
#find ~/.local/share/applications \
#~/.local/share/flatpak/exports/share/applications \
#/var/lib/flatpak/exports/share/applications \
#/usr/share/applications \ -name "*.desktop"

apps=(
  "Brave:brave-browser"
  "Blender:blender"
  "WebStorm:jetbrains-webstorm"
  "Steam:steam"
  "Discord:com.discordapp.Discord"
)

# Locations containing .desktop entries
desktop_paths=(
  "$HOME/.local/share/applications"
  "$HOME/.local/share/flatpak/exports/share/applications"
  "/var/lib/flatpak/exports/share/applications"
  "/usr/share/applications"
)

chosen=$(
  for app in "${apps[@]}"; do
    # Split "Name:desktop"
    name="${app%%:*}"
    desktop="${app##*:}"

    desktop_file=""

    # Find matching .desktop file
    for path in "${desktop_paths[@]}"; do
      desktop_file=$(find "$path" -maxdepth 1 -name "${desktop}*.desktop" 2>/dev/null | head -n1)

      # Stop once found
      if [[ -n "$desktop_file" ]]; then
        break
      fi
    done

    # Read icon name from desktop entry
    icon=$(grep -m1 '^Icon=' "$desktop_file")
    icon="${icon#Icon=}"

    # Build rofi entry with icon
    echo -en "${name}\0icon\x1f${icon}\n"

  done | rofi -dmenu -show-icons -i -p "Apps"
)

# Launch selected app
for app in "${apps[@]}"; do
  name="${app%%:*}"
  desktop="${app##*:}"

  if [[ "$chosen" == "$name" ]]; then
    desktop_file=""

    # Find matching .desktop file again
    for path in "${desktop_paths[@]}"; do
      desktop_file=$(find "$path" -maxdepth 1 -name "${desktop}*.desktop" 2>/dev/null | head -n1)

      if [[ -n "$desktop_file" ]]; then
        break
      fi
    done

    # Remove ".desktop" extension for gtk-launch
    gtk-launch "$(basename "$desktop_file" .desktop)"
    break
  fi
done