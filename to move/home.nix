{ config, pkgs, ... }:
{
  imports =
    [
      ./home-manager-config/imports/all.nix
      ./home-manager-config/imports/desktop.nix
    ];
}
