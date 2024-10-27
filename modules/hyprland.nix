{ config, pkgs, ... }:
{
  imports =
  [
    ./hyprland/bind.nix
    ./hyprland/else.nix
  ];
}
