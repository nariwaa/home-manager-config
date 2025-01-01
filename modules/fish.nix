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

#alias
alias e nvim
alias music-dlp='yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --embed-metadata -o "%(creator,uploader,channel)s - %(title)s.%(ext)s"'

    '';
  };
}
