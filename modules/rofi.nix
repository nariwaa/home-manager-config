{ config, pkgs, ... }:
{

  imports =
    [
    ./rofi/select-dark.nix
    ./rofi/select-light.nix
    ./rofi/wall-dark.nix
    ./rofi/wall-light.nix
    ];

  programs.rofi = {
    enable = true;
    plugins = [
      pkgs.rofi-emoji
      pkgs.rofi-calc
      pkgs.rofi-obsidian
      pkgs.rofi-power-menu
    ];

    # Basic configuration
    terminal = "${pkgs.kitty}/bin/kitty";
    font = "Figtree 20";
    
    # rofi -show combi -combi-modi "drun,power:rofi-power-menu,obsidian:rofi-obsidian,emoji" -modi combi
    extraConfig = {
      modi = "drun,emoji";
      show-icons = true;
      display-drun = "💠";
      display-clipboard = "📋";
      display-emoji = "💫";
      display-calc = "🧮";
      display-combi = "🔎";
      display-power = "🔌";
      display-obsidian = "🪨";
    };

    # Theme configuration
    theme = let 
      # Define your colors here
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "@import" = "~/.cache/wal/colors-rofi-dark";
      
      "*" = {
        "g-spacing" = mkLiteral "10px";
        "g-margin" = mkLiteral "0";
        "b-color" = mkLiteral "#000000FF";
        "fg-color" = mkLiteral "#FFFFFFFF";
        "fgp-color" = mkLiteral "#888888FF";
        "b-radius" = mkLiteral "8px";
        "g-padding" = mkLiteral "8px";
        "hl-color" = mkLiteral "#FFFFFFFF";
        "hlt-color" = mkLiteral "#000000FF";
        "alt-color" = mkLiteral "#111111FF";
        "wbg-color" = mkLiteral "#000000CC";
        "w-border" = mkLiteral "2px solid";
        "w-border-color" = mkLiteral "#FFFFFFFF";
        "w-padding" = mkLiteral "12px";
      };

      
      "element-icon" = {  # Add this block to control icon appearance
        size = mkLiteral "32px";  # Should match icon-theme-size
        spacing = mkLiteral "10px";
      };

      "listview" = {
        columns = mkLiteral "1";
        lines = mkLiteral "6";
        "fixed-height" = true;
        "fixed-columns" = true;
        cycle = false;
        scrollbar = true;
        border = mkLiteral "10px solid";
      };

      "window" = {
        transparency = mkLiteral "\"real\"";
        width = mkLiteral "1000px";
        "border-radius" = mkLiteral "@b-radius";
        border = mkLiteral "@w-border";
        "border-color" = mkLiteral "@w-border-color";
        padding = mkLiteral "@w-padding";
        location = mkLiteral "center";
        anchor = mkLiteral "center";
        x-offset = mkLiteral "0";
        y-offset = mkLiteral "0";
      };

      "prompt" = {
        "text-color" = mkLiteral "@fg-color";
      };

      "inputbar" = {
        children = map mkLiteral [ "prompt" "entry" ];
        spacing = mkLiteral "@g-spacing";
      };

      "entry" = {
        placeholder = "Search Apps";
        "text-color" = mkLiteral "@fg-color";
        "placeholder-color" = mkLiteral "@fgp-color";
      };

      "mainbox" = {
        spacing = mkLiteral "@g-spacing";
        margin = mkLiteral "@g-margin";
        padding = mkLiteral "@g-padding";
        children = map mkLiteral [ "inputbar" "listview" "message" ];
      };

      "element" = {
        spacing = mkLiteral "@g-spacing";
        margin = mkLiteral "@g-margin";
        padding = mkLiteral "@g-padding";
        border = mkLiteral "0px solid";
        "border-radius" = mkLiteral "@b-radius";
        "border-color" = mkLiteral "@b-color";
        "background-color" = mkLiteral "transparent";
        "text-color" = mkLiteral "@fg-color";
      };

      "element normal.normal" = {
        "background-color" = mkLiteral "transparent";
        "text-color" = mkLiteral "@fg-color";
      };

      "element alternate.normal" = {
        "background-color" = mkLiteral "transparent";
        "text-color" = mkLiteral "@fg-color";
      };

      "element selected.active" = {
        "background-color" = mkLiteral "@hl-color";
        "text-color" = mkLiteral "@hlt-color";
      };

      "element selected.normal" = {
        "background-color" = mkLiteral "@hl-color";
        "text-color" = mkLiteral "@hlt-color";
      };

      "message" = {
        "background-color" = mkLiteral "red";
        border = mkLiteral "0px solid";
      };
    };
  };
}
