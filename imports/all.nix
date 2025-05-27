{ config, pkgs, ... }:
{
  home.username = "ayaya";
  home.homeDirectory = "/home/ayaya";
  home.stateVersion = "23.11"; 
  imports =
    [
      ./../modules/rofi.nix
      ./../modules/fastfetch.nix
      ./../modules/starship.nix
      ./../modules/waybar.nix
      ./../modules/default-apps.nix
      ./../modules/hyprland.nix
      ./../modules/fish.nix
      ./../modules/hyprlock.nix
      ./../modules/else.nix
      ./../modules/sh.nix
    ];
}
