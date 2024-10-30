{ config, pkgs, ... }:

let
  screenv = import ../../../local/monitorvariable.nix;
in

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # Workspace rules
      workspace = [
        "1, monitor:${screenv.screen1}, persistent:1"
        "2, monitor:${screenv.screen1}, persistent:1"
        "3, monitor:${screenv.screen1}, persistent:1"
        "4, monitor:${screenv.screen1}, persistent:1"
        "5, monitor:${screenv.screen1}, persistent:1"
        "6, monitor:${screenv.screen1}, persistent:1"
        "7, monitor:${screenv.screen1}, persistent:1"
        "8, monitor:${screenv.screen1}, persistent:1"
        "9, monitor:${screenv.screen1}, persistent:1"
        "10, monitor:${screenv.screen1}, persistent:1"
        "11, monitor:DP-2, persistent:1"
        "12, monitor:DP-2, persistent:1"
        "21, monitor:HDMI-A-2, persistent:1"
        "22, monitor:HDMI-A-2, persistent:1"
      ];
    };
  };
}
