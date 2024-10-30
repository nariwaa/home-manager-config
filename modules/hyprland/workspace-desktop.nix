{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
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
    };
  };
}
