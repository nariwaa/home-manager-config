{
  home.file."/home/ayaya/.config/sh/wall-choose.sh" = {
    text = ''
      #!/usr/bin/env bash

      display_wallpapers() {
          local mode=$1 # "Light" or "Dark"
          local dir="$HOME/Wall/$mode"
          local wallpaper_picker_theme=""

          if [[ "$mode" == "Dark" ]]; then
            wallpaper_picker_theme="$HOME/.config/rofi/themes/wall-dark.rasi"
          else
            wallpaper_picker_theme="$HOME/.config/rofi/themes/wall-light.rasi"
          fi

          local selected=$(find "$dir" -type f \( -iname "*.gif" -o -iname "*.png" \) | \
          while read -r img; do
            echo -en "$img\x00icon\x1f$img\n"
          done | rofi -dmenu -i \
                      -theme "$wallpaper_picker_theme" \
                      -show-icons \
                      -width 1000 -lines 10 -eh 1 -matching fuzzy)

          if [[ -n "$selected" ]]; then
            # Call 'wall' script with the selected wallpaper and the mode
            # This assumes 'wall' (your pkgs.writeShellScriptBin "wall" script)
            # is in your PATH.
            wall "$selected" "$mode"
          fi
      }

      current_hour=$(date +%H)
      simple_mode_theme=""

      if (( current_hour >= 6 && current_hour < 19 )); then
        simple_mode_theme="$HOME/.config/rofi/themes/select-light.rasi"
      else
        simple_mode_theme="$HOME/.config/rofi/themes/select-dark.rasi"
      fi

      tlight="󰖨"
      tdark=""
      tback=""

      mode_selection=$(echo -e "$tlight\n$tdark\n$tback" | rofi -dmenu -i \
                  -theme "$simple_mode_theme" \
                  -show-icons \
                  -width 300 -lines 3 -eh 1 -matching fuzzy)

      case "$mode_selection" in
          "$tlight")
              display_wallpapers "Light"
              ;;
          "$tdark")
              display_wallpapers "Dark"
              ;;
          "$tback")
              exit 0
              ;;
          *)
              exit 1
              ;;
      esac
    '';
    executable = true;
  };
}
