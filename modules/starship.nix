{ config, pkgs, ... }:
{
  programs.starship.enable = true;
  programs.starship.enableFishIntegration = true;
  programs.starship.settings = {
    add_newline = true;
    format = "┌─$cmd_duration$username@$hostname$all[>](bright-white bold)
└─$character";
    shell = {
      disabled = true;
    };
    hostname = {
      ssh_only = false;
      format = "[$hostname]($style)[\\]-< ](bright-white bold)";
    };
    username = {
      format = "[\\[](bright-white bold)[$user]($style)";
      show_always = true;
      style_root = "bright-red bold";
    };
    cmd_duration = {
      format = "[\\[](bright-blue bold)[$duration](bright-blue bold)[\\]](bright-blue bold)[-](bright-white bold)";
    };
    line_break = {
      disabled = true;
      };
  };
}
