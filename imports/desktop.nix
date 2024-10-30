{ config, pkgs, ... }:
{
  imports =
    [
    ./../modules/hyprland/workspace-desktop.nix
    ./../modules/hyprland/input-gestures-desktop.nix
    ];
}
