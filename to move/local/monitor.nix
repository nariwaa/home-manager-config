# ############################################################# #
# ADD THIS TO ~/.config/home-manager/local/monitor.nix #
# ############################################################# #

{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # Monitor configuration
      monitor = [
        "DP-1, 2560x1440@165, 0x0, 1"
        "DP-2, 1920x1080@60, 250x-1080, 1"
        "HDMI-A-2, 1920x1080, -1080x-230, 1, transform, 3"
      ];
    };
  };
}
