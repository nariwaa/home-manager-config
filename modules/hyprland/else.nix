{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # Startup applications
      "exec-once" = [
        "waybar"
        "swww-daemon"
        "kdeconnect-indicator"
        "polkit"
        "fcitx5 -d -r"
        "fcitx5-remote -r"
        "dunst"
        "greenclip daemon"
        "hyprctl hyprctl setcursor Bibata-Modern-Classic 35"
        "ulauncher"
      ];

      # Environment variables
      env = [
        "HYPRCURSOR_THEME,Bibata-Modern-Classic"
        "HYPRCURSOR_SIZE,35"
      ];

      # Window rules
      windowrule = [
        "pseudo, fcitx"
      ];

      # Animations
      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      # Debug settings
      debug = {
        disable_logs = false;
        enable_stdout_logs = true;
      };

      # Decoration settings
      decoration = {
        blur = {
          enabled = true;
          size = 10;
          passes = 2;
        };
        shadow = {
          enabled = true;
          range = 6;
          render_power = 6;
        };
        rounding = 10;
      };

      # General settings
      general = {
        border_size = 5;
        "col.active_border" = "rgba(ffffffee) rgba(eeeeeeee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        gaps_in = 5;
        gaps_out = 10;
      };

      # Miscellaneous settings
      misc = {
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        disable_hyprland_logo = true;
        enable_swallow = true;
        render_ahead_of_time = false;
      };
    };
  };
}
