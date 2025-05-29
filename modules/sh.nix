{ config, pkgs, ... }:
{
  imports =
    [
    ./sh/wall-choose.nix
    ./sh/wall-regenerate.nix
    ];
}
