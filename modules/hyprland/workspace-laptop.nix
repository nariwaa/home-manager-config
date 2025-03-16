{ config, pkgs, ... }:

let
  screenv = import ../../../local/monitorvariable.nix;
in

{
  wayland.windowManager.hyprland = {
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
        "11, monitor:${screenv.screen2}"
        "12, monitor:${screenv.screen2}"
        "21, monitor:${screenv.screen3}"
        "22, monitor:${screenv.screen3}"
      ];
    };
  };
}
