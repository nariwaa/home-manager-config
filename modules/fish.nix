{ config, pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''

starship init fish | source
set -U fish_greeting
cat /home/ayaya/.cache/wal/sequences  
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
eval $(keychain --eval --quiet --agents ssh banana)
alias e nvim

    '';
  };
}
