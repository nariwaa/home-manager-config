{ config, pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''

starship init fish | source
set -U fish_greeting
cat /home/ayaya/.cache/wal/sequences  

    '';
  };
}
