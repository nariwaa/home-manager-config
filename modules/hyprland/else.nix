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

      # Workspace rules
      workspace = [
        "1, monitor:DP-1, persistent:1"
        "2, monitor:DP-1, persistent:1"
        "3, monitor:DP-1, persistent:1"
        "4, monitor:DP-1, persistent:1"
        "5, monitor:DP-1, persistent:1"
        "6, monitor:DP-1, persistent:1"
        "7, monitor:DP-1, persistent:1"
        "8, monitor:DP-1, persistent:1"
        "9, monitor:DP-1, persistent:1"
        "10, monitor:DP-1, persistent:1"
        "11, monitor:DP-2, persistent:1"
        "12, monitor:DP-2, persistent:1"
        "21, monitor:HDMI-A-2, persistent:1"
        "22, monitor:HDMI-A-2, persistent:1"
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
        drop_shadow = true;
        rounding = 10;
        shadow_range = 4;
        shadow_render_power = 3;
      };

      # General settings
      general = {
        border_size = 5;
        "col.active_border" = "rgba(ffffffee) rgba(eeeeeeee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        gaps_in = 5;
        gaps_out = 10;
      };

      # Gesture settings
      gestures = {
        workspace_swipe = true;
        workspace_swipe_distance = 200;
        workspace_swipe_fingers = 3;
        workspace_swipe_forever = true;
        workspace_swipe_invert = true;
      };

      # Input settings
      input = {
        touchpad = {
          natural_scroll = true;
        };
        scroll_factor = 1;
        follow_mouse = 1;
        kb_layout = "us";
        kb_options = "$escswap, grp:alt_space_toggle";
        kb_variant = "altgr-intl";
        sensitivity = -0.5;
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