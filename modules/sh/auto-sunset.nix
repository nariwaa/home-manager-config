{ pkgs, ... }: {
  home.file."/home/ayaya/.config/sh/auto-sunset.sh" = {
    executable = true;
    text = ''
      #!${pkgs.bash}/bin/bash

      # --- user configuration ---
      LAT="43.61N" # Montpellier, France
      LON="3.87E"
      NIGHT_TEMP=3500 # the temperature for night mode
      # --- end of configuration ---

      echo "starting auto-sunset script..."

      # first, check if it's currently day or night
      ${pkgs.sunwait}/bin/sunwait poll ''${LAT} ''${LON}
      CURRENT_STATE=$?

      if [ "$CURRENT_STATE" -eq 2 ]; then
        # it's currently DAY (exit code 2)
        echo "it's daytime! waiting for sunset..."
        
        # wait until sunset happens
        ${pkgs.sunwait}/bin/sunwait wait set ''${LAT} ''${LON}
        
        echo "sunset happened! setting night temperature (''${NIGHT_TEMP}K)"
        hyprctl hyprsunset temperature ''${NIGHT_TEMP}
        
      else
        # it's currently NIGHT (exit code 3 or other)
        echo "it's nighttime! waiting for sunrise..."
        
        # wait until sunrise happens
        ${pkgs.sunwait}/bin/sunwait wait rise ''${LAT} ''${LON}
        
        echo "sunrise happened! setting normal temperature"
        hyprctl hyprsunset identity
      fi

      # wait 10 seconds like you asked
      echo "waiting 10 seconds before running wallpaper script..."
      ${pkgs.coreutils}/bin/sleep 10

      # run your wallpaper script!
      echo "running wall-random.sh..."
      ${pkgs.bash}/bin/bash /home/ayaya/.config/sh/wall-random.sh

      echo "auto-sunset script finished!"
    '';
  };
}
