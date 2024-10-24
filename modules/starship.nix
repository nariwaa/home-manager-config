{ config, pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    plugins = [
      pkgs.rofi-emoji
      pkgs.rofi-calc
    ];
  };
}
