{ config, pkgs, ... }:
{
  imports =
  [
    ./hyprland/bind.nix
    ./hyprland/else.nix
    ./../../local/monitor.nix
  ];
}
