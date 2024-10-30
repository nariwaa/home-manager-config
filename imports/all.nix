{ config, pkgs, ... }:
{
    [
      ./../modules/rofi.nix
      ./../modules/starship.nix
      ./../modules/waybar.nix
      ./../modules/default-apps.nix
      ./../modules/hyprland.nix
      ./../modules/fish.nix
      ./../modules/hyprlock.nix
    ];
}
