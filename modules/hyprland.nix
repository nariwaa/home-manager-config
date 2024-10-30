{ config, pkgs, ... }:
{
  imports =
  [
    ./hyprland/bind.nix
    ./hyprland/else.nix
    ~/.config/home-manager/local/monitor.nix
  ];
}
