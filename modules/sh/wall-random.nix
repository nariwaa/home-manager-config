{ pkgs, ... }: # This assumes 'pkgs' is available in the scope of your Nix configuration

{
  home.file."/home/ayaya/.config/sh/wall-random.sh" = {
    executable = true;
    text = ''
      #!${pkgs.bash}/bin/bash

      current_hour=$(${pkgs.coreutils}/bin/date +%H)
      light_dir="$HOME/Wall/Light"
      dark_dir="$HOME/Wall/Dark"
      target_dir=""
      mode=""

      if (( current_hour >= 6 && current_hour < 19 )); then
        target_dir="$light_dir"
        mode="Light"
      else
        target_dir="$dark_dir"
        mode="Dark"
      fi

      if [[ ! -d "$target_dir" ]]; then
        echo "error: directory '$target_dir' does not exist." >&2
        exit 1
      fi

      # Find image files and select one randomly
      # Added .jpg and .jpeg to the search
      random_wallpaper_path=$(${pkgs.findutils}/bin/find "$target_dir" -type f \
        \( -iname "*.gif" -o -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) \
        | ${pkgs.coreutils}/bin/shuf -n 1)

      if [[ -n "$random_wallpaper_path" && -f "$random_wallpaper_path" ]]; then
        echo "setting random wallpaper: $random_wallpaper_path for $mode mode"
        # This calls your existing 'wall' script, assuming it's in PATH
        # (which it should be if defined with pkgs.writeShellScriptBin "wall")
        wall "$random_wallpaper_path" "$mode"
      else
        echo "error: no suitable wallpaper found in '$target_dir'." >&2
        exit 1
      fi

      # The script will exit with the status of the 'wall' command,
      # or 1 if errors occurred before that.
    '';
  };
}

