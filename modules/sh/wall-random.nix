{ pkgs, ... }: {
  home.file."/home/ayaya/.config/sh/wall-random.sh" = {
    executable = true;
    text = ''
      #!${pkgs.bash}/bin/bash

      # --- user configuration ---
      # put your latitude and longitude here! (use N/S and E/W)
      LAT="43.61N"
      LON="3.87E"
      # --- end of configuration ---

      light_dir="$HOME/Wall/Light"
      dark_dir="$HOME/Wall/Dark"
      target_dir=""
      mode=""

      # --- sunwait logic ---
      # Run sunwait in 'poll' mode. It exits with code 2 for DAY and 3 for NIGHT.
      ${pkgs.sunwait}/bin/sunwait poll ''${LAT} ''${LON}
      EXIT_CODE=$?

      # Check the exit code to see if it's day or night
      if [ "$EXIT_CODE" -eq 2 ]; then
        # Exit code 2 means it's DAY
        target_dir="$light_dir"
        mode="Light"
      else
        # Exit code 3 (or anything else) means it's NIGHT
        target_dir="$dark_dir"
        mode="Dark"
      fi

      if [[ ! -d "$target_dir" ]]; then
        echo "error: directory '$target_dir' does not exist." >&2
        exit 1
      fi

      # Find image files and select one randomly
      random_wallpaper_path=$(${pkgs.findutils}/bin/find "$target_dir" -type f \
        \( -iname "*.gif" -o -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) \
        | ${pkgs.coreutils}/bin/shuf -n 1)

      if [[ -n "$random_wallpaper_path" && -f "$random_wallpaper_path" ]]; then
        echo "setting random wallpaper: $random_wallpaper_path for $mode mode"
        wall "$random_wallpaper_path" "$mode"
      else
        echo "error: no suitable wallpaper found in '$target_dir'." >&2
        exit 1
      fi
    '';
  };
}
