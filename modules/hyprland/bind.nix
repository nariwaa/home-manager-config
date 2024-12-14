{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
      # Key bindings
      bind = [
        # Terminal and window management
        "SUPER, Return, exec, alacritty"
        "SUPER, C, killactive"
        "SUPER, E, exec, thunar"
        "SUPER, F, togglefloating"
        "SUPER SHIFT, F, fullscreen"
        "SUPER, T, exec, kitty"
        "SUPER CTRL, Escape, exit"
        "SUPER, Escape, exec, hyprlock"

        # Clipboard management
        "SUPER, V, exec, rofi -modi \"clipboard:greenclip print\" -show clipboard -run-command '{cmd}'"
        "SUPER SHIFT, V, exec, greenclip clear"

        # Rofi launchers
        "SUPER, Space, exec, rofi -show combi -combi-modi \"drun,obsidian:rofi-obsidian,emoji,power:rofi-power-menu\" -modi combi"
        "SUPER CTRL, Space, exec, rofi -show calc"
        "SUPER, W, exec, ~/.config/sh/wall-choose.sh"
        "SUPER ALT, W, exec, kitty --hold sh ~/.config/sh/wall-regenerate.sh"

        # Screenshot bindings
        "SUPER, P, exec, screenl"
        "SUPER SHIFT, P, exec, screens"
        "CTRL, home, exec, screent"

        # Focus movement
        "SUPER, h, movefocus, l"
        "SUPER, l, movefocus, r"
        "SUPER, k, movefocus, u"
        "SUPER, j, movefocus, d"

        # Window swapping
        "SUPER SHIFT, h, swapwindow, l"
        "SUPER SHIFT, l, swapwindow, r"
        "SUPER SHIFT, k, swapwindow, u"
        "SUPER SHIFT, j, swapwindow, d"

        # Window resizing
        "SUPER CTRL, h, resizeactive, -60 0"
        "SUPER CTRL, l, resizeactive, 60 0"
        "SUPER CTRL, k, resizeactive, 0 -60"
        "SUPER CTRL, j, resizeactive, 0 60"

        # Workspace switching
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, 0, workspace, 10"
        "SUPER, I, workspace, 11"
        "SUPER, O, workspace, 12"
        "SUPER, Y, workspace, 21"
        "SUPER, U, workspace, 22"

        # Move windows to workspaces
        "SUPER SHIFT, 1, movetoworkspacesilent, 1"
        "SUPER SHIFT, 2, movetoworkspacesilent, 2"
        "SUPER SHIFT, 3, movetoworkspacesilent, 3"
        "SUPER SHIFT, 4, movetoworkspacesilent, 4"
        "SUPER SHIFT, 5, movetoworkspacesilent, 5"
        "SUPER SHIFT, 6, movetoworkspacesilent, 6"
        "SUPER SHIFT, 7, movetoworkspacesilent, 7"
        "SUPER SHIFT, 8, movetoworkspacesilent, 8"
        "SUPER SHIFT, 9, movetoworkspacesilent, 9"
        "SUPER SHIFT, 0, movetoworkspacesilent, 10"
        "SUPER SHIFT, I, movetoworkspacesilent, 11"
        "SUPER SHIFT, O, movetoworkspacesilent, 12"
        "SUPER SHIFT, Y, movetoworkspacesilent, 21"
        "SUPER SHIFT, U, movetoworkspacesilent, 22"

        # Additional workspace navigation
        "SUPER ALT, h, workspace, e-1"
        "SUPER ALT, l, workspace, e+1"
        "SUPER, mouse_down, workspace, e+1"
        "SUPER, mouse_up, workspace, e-1"

        # Reload configuration
        "SUPER SHIFT, B, exec, hypr-waybar-reload"

        # Volume controls
        "SUPER, equal, exec, pamixer -i 10"
        "SUPER, minus, exec, pamixer -d 10"
        "SUPER SHIFT, equal, exec, pamixer -i 1"
        "SUPER SHIFT, minus, exec, pamixer -d 1"
        "SUPER, backspace, exec, pamixer -t"

        # Brightness controls
        "SUPER, bracketleft, exec, brightnessctl set 5%-"
        "SUPER, bracketright, exec, brightnessctl set 5%+"
        "SUPER SHIFT, bracketleft, exec, brightnessctl set 1%-"
        "SUPER SHIFT, bracketright, exec, brightnessctl set 1%+"
      ];

      # Media key bindings
      bindl = [
        ", xf86audioraisevolume, exec, pamixer -i 5"
        ", xf86audiolowervolume, exec, pamixer -d 5"
        ", xf86audiomute, exec, pamixer -t"
        ", xf86monbrightnessup, exec, $brightness --inc"
        ", xf86monbrightnessdown, exec, $brightness --dec"
        ", xf86audioplay, exec, playerctl play-pause"
        ", xf86audionext, exec, playerctl next"
        ", xf86audioprev, exec, playerctl previous"
      ];

      # Mouse bindings
      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];
  };
}
