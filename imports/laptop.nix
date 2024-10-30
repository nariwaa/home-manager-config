{ config, pkgs, ... }:
{
  imports =
    [
    ./../modules/hyprland/workspace-laptop.nix
    ./../modules/hyprland/input-gestures-laptop.nix
    ];
}
