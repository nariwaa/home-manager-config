{ config, pkgs, ... }:
{
  imports =
    [
    ./sh/wall-choose.nix
    ./sh/wall-set.nix
    ];
}
