# ############################################################# #
# ADD THIS TO ~/.config/home-manager-local/hyprland/monitor.nix #
# ############################################################# #

{ config, pkgs, ... }:

let
  screenv = import ./monitorvariable.nix;
in

{
  wayland.windowManager.hyprland = {
    settings = {
      # Monitor configuration
      monitor = [
        "${screenv.screen1}, 2560x1440@165, 0x0, 1"
        "${screenv.screen2}, 1920x1080@60, 250x-1080, 1"
        "${screenv.screen3}, 1920x1080, -1080x-230, 1, transform, 3"
      ];
    };
  };
}
