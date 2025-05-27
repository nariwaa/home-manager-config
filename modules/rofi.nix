{ config, pkgs, ... }:
{
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
  home.file.".config/rofi/themes/wall-dark.rasi".text = ''
    /*****----- Configuration -----*****/
    configuration {
        modi:                       "drun,run,filebrowser,window";
        show-icons:                 true;
        display-drun:               "APPS";
        display-run:                "RUN";
        display-filebrowser:        "FILES";
        display-window:             "WINDOWS";
        drun-display-format:        "{name}";
        window-format:              "{w} · {c}";
    }

    /*****----- Pywal Import -----*****/
    @import "~/.cache/wal/colors-rofi-dark.rasi" /* <-- your pywal import path! */

    /*****----- Global Properties -----*****/
    * {
        font:                        "JetBrains Mono Nerd Font 10";
        background-color:            @background;
        text-color:                  @foreground;
    }

    /*****----- Main Window -----*****/
    window {
        padding:                     0ch;
        transparency:                "real";
        location:                    center;
        anchor:                      center;
        fullscreen:                  false;
        width:                       1000px;
        x-offset:                    0px;
        y-offset:                    0px;
        enabled:                     true;
        border-radius:               25px;
        cursor:                      "default";
        background-color:            @background; /* from pywal */
    }

    /*****----- Main Box -----*****/
    mainbox {
        enabled:                     true;
        spacing:                     0px;
        background-color:            transparent;
        orientation:                 vertical;
        children:                    [ "inputbar", "listbox" ];
    }

    listbox {
        spacing:                     20px;
        padding:                     20px;
        background-color:            transparent;
        orientation:                 vertical;
        children:                    [ "message", "listview" ];
    }

    /*****----- Inputbar -----*****/
    inputbar {
        enabled:                     true;
        spacing:                     10px;
        padding:                     100px 60px;
        background-color:            transparent;
        background-image:         url("/tmp/current.png", width); 
        text-color:                  @foreground; /* from pywal */
        orientation:                 horizontal;
        children:                    [ "idk", "dummy", "mode-switcher" ];
    }
    idk {
        enabled: true;
        spacing:                     10px;
        padding:                     10px 60px;
        background-color:            transparent;
        text-color:                  @foreground; /* from pywal */
        orientation:                 vertical;
        children:                    [ "search-icon-whatever", "entry" ];
    }
    search-icon-whatever {
        children: [ "textbox-prompt-colon", "dummy"];
        orientation:                 horizontal;
        background-color: transparent;
    }
    textbox-prompt-colon { /* Search icon background */
        enabled:                     true;
        expand:                      false;
        str:                         "  search ";
        padding:                     12px 16px;
        border-radius:               100%;
        background-color:            @active-background; /* pywal accent */
        text-color:                  black;        /* light text on accent */
    }
    entry {
        enabled:                     true;
        expand:                      false;
        width:                       300px;
        padding:                     11px 15px; /* Adjusted padding for border */
        border:                      1px solid;   /* Define style and width */
        border-color:                @foreground; /* Then define color */
        border-radius:               100%;
        background-color:            @background; /* main background for field */
        text-color:                  @foreground; /* main text color */
        cursor:                      text;
        placeholder:                 "Wallpapers name";
        placeholder-color:           inherit;
    }
    dummy {
        expand:                      true;
        background-color:            transparent;
    }

    /*****----- Mode Switcher -----*****/
    mode-switcher{
        enabled:                     true;
        spacing:                     10px;
        background-color:            transparent;
        text-color:                  @foreground; /* from pywal */
    }
    button {
        width:                       80px;
        padding:                     0px; /* Adjusted padding for border */
        border:                      1px solid;   /* Define style and width */
        border-color:                @foreground; /* Then define color */
        border-radius:               100%;
        background-color:            @background; /* main background for button */
        text-color:                  @foreground; /* main text color */
        cursor:                      pointer;
    }
    button selected {
        background-color:            @selected-normal-background; /* pywal selected color */
        text-color:                  @background;                 /* light text on accent */
        border:                      0px solid;                   /* Define style and width */
        border-color:                @selected-normal-background; /* Then define color, same as bg */
    }

    /*****----- Listview -----*****/
    listview {
        enabled:                     true;
        columns:                     4;
        lines:                       3;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   false;
        layout:                      vertical;
        reverse:                     false;
        fixed-height:                true;
        fixed-columns:               true;
        spacing:                     10px;
        background-color:            transparent;
        text-color:                  @foreground; /* from pywal */
        cursor:                      "default";
    }

    /*****----- Elements -----*****/
    element {
        enabled:                     true;
        spacing:                     0px;
        padding:                     10px;
        border-radius:               25px;
        background-color:            transparent;
        text-color:                  @foreground; /* from pywal */
        cursor:                      pointer;
        orientation:                 vertical;
    }
    element normal.normal {
        background-color:            inherit; /* Should be transparent, showing listbox bg */
        text-color:                  inherit; /* Should be @foreground */
    }
    element normal.urgent {
        background-color:            @urgent-background; /* pywal urgent color */
        text-color:                  @background;        /* light text on accent */
    }
    element normal.active {
        background-color:            @active-background; /* pywal active color */
        text-color:                  @background;        /* light text on accent */
    }
    element selected.normal {
        background-color:            @selected-normal-background; /* pywal selected color */
        text-color:                  @background;                 /* light text on accent */
    }
    element selected.urgent {
        background-color:            @selected-urgent-background; /* pywal specific */
        text-color:                  @background;                 /* light text on accent */
    }
    element selected.active {
        background-color:            @selected-active-background; /* pywal specific */
        text-color:                  @background;                 /* light text on accent */
    }
    element-icon {
        background-color:            @selected-active-background;
        text-color:                  inherit;
        size:                        340px;
        cursor:                      inherit;
        border-radius:               25;
        vertical-align:0.5;
        horizontal-align:0.5;
        padding:-100px;
    }
    element-text {
        enabled:                     false;
    }

    /*****----- Message -----*****/
    message {
        background-color:            transparent;
    }
    textbox { /* This is for the message box if rofi shows one (e.g. help text) */
        padding:                     14px; /* Adjusted padding for border */
        border:                      1px solid;   /* Define style and width */
        border-color:                @foreground; /* Then define color */
        border-radius:               15px;
        background-color:            @background; /* main background */
        text-color:                  @foreground; /* main text color */
        vertical-align:              0.5;
        horizontal-align:            0.0;
    }
    error-message {
        padding:                     15px;
        border-radius:               15px;
        background-color:            @urgent-background; /* Use urgent color for error bg */
        text-color:                  @background;        /* Light text for contrast */
    }
  '';

  home.file.".config/rofi/themes/select-light.rasi".text = ''
    @import "~/.cache/wal/colors-rofi-light.rasi"

    * {
        font:                        "JetBrains Mono Nerd Font 20";
        background-color:        @selected-urgent-background;
        border-radius:               25px;
        border-color:                @selected-normal-background;
    }

    window {
        transparency:                "real";
        location:                    center;
        anchor:                      center;
        fullscreen:                  false;
        width:                       800px;
        x-offset:                    0px;
        y-offset:                    0px;
        enabled:                     true;
        margin:                      0px;
        padding:                     0px;
        border:                      10px solid;
        cursor:                      "default";
    }

    mainbox {
        enabled:                     true;
        spacing:                     30px;
        margin:                      40px;
        padding:                     40px;
        border:                      0px solid;
        border-radius:               25px;
        children:                    [ "listview" ];
    }

    inputbar {
        enabled:                     true;
        spacing:                     10px;
        margin:                      0px 0px 20px 0px;
        padding:                     0px;
        border:                      0px;
        border-radius:               0px;
        background-color:            transparent;
        children:                    [ "textbox-prompt-colon", "dummy", "prompt" ];
    }

    dummy {
        background-color:            transparent;
        expand: true;
    }

    textbox-prompt-colon {
        enabled:                     true;
        expand:                      false;
        str:                         "MENU";
        padding:                     15px 20px;
        border-radius:               15px;
        background-color:            @background;
    }
    prompt {
        enabled:                     true;
        expand:                      false;
        padding:                     15px 20px;
        border-radius:               15px;
        background-color:            @background;
        text-color:                  @active;
    }

    message {
        enabled:                     true;
        margin:                      0px 100px;
        padding:                     20px;
        border:                      0px;
        border-radius:               15px;
    }
    textbox {
        vertical-align:              0.5;
        horizontal-align:            0.5;
        blink:                       true;
        markup:                      true;
    }
    error-message {
        padding:                     20px;
        border:                      0px solid;
        border-radius:               15px;
    }

    listview {
        enabled:                     true;
        columns:                     3;
        lines:                       1;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   false;
        layout:                      vertical;
        reverse:                     false;
        fixed-height:                true;
        fixed-columns:               true;
        spacing:                     20px;
        margin:                      0px;
        padding:                     10px;
        border:                      0px solid;
        border-radius:               15px;
        cursor:                      "default";
    }

    element {
        enabled:                     true;
        spacing:                     0px;
        margin:                      0px;
        padding:                     60px;
        border:                      0px solid;
        border-radius:               10px;
        cursor:                      pointer;
    }
    element-text {
        font:                        "JetBrains Mono Nerd Font 20";
        background-color:            transparent;
        text-color:                  inherit;
        cursor:                      inherit;
        vertical-align:              0.5;
        horizontal-align:            0.5;
    }
    element-icon {
        enabled:                     false;
    }
    element selected.normal {
        border-radius:               10px;
    }
  '';

  home.file.".config/rofi/themes/wall-light.rasi".text = ''
    /*****----- Configuration -----*****/
    configuration {
        modi:                       "drun,run,filebrowser,window";
        show-icons:                 true;
        display-drun:               "APPS";
        display-run:                "RUN";
        display-filebrowser:        "FILES";
        display-window:             "WINDOWS";
        drun-display-format:        "{name}";
        window-format:              "{w} · {c}";
    }

    /*****----- Pywal Import -----*****/
    @import "~/.cache/wal/colors-rofi-light.rasi" /* <-- your pywal import path! */

    /*****----- Global Properties -----*****/
    * {
        font:                        "JetBrains Mono Nerd Font 10";
        background-color:            @background;
        text-color:                  @foreground;
    }

    /*****----- Main Window -----*****/
    window {
        padding:                     0ch;
        transparency:                "real";
        location:                    center;
        anchor:                      center;
        fullscreen:                  false;
        width:                       1000px;
        x-offset:                    0px;
        y-offset:                    0px;
        enabled:                     true;
        border-radius:               25px;
        cursor:                      "default";
        background-color:            @background; /* from pywal */
    }

    /*****----- Main Box -----*****/
    mainbox {
        enabled:                     true;
        spacing:                     0px;
        background-color:            transparent;
        orientation:                 vertical;
        children:                    [ "inputbar", "listbox" ];
    }

    listbox {
        spacing:                     20px;
        padding:                     20px;
        background-color:            transparent;
        orientation:                 vertical;
        children:                    [ "message", "listview" ];
    }

    /*****----- Inputbar -----*****/
    inputbar {
        enabled:                     true;
        spacing:                     10px;
        padding:                     100px 60px;
        background-color:            transparent;
        background-image:         url("/tmp/current.png", width); 
        text-color:                  @foreground; /* from pywal */
        orientation:                 horizontal;
        children:                    [ "idk", "dummy", "mode-switcher" ];
    }
    idk {
        enabled: true;
        spacing:                     10px;
        padding:                     10px 60px;
        background-color:            transparent;
        text-color:                  @foreground; /* from pywal */
        orientation:                 vertical;
        children:                    [ "search-icon-whatever", "entry" ];
    }
    search-icon-whatever {
        children: [ "textbox-prompt-colon", "dummy"];
        orientation:                 horizontal;
        background-color: transparent;
    }
    textbox-prompt-colon { /* Search icon background */
        enabled:                     true;
        expand:                      false;
        str:                         " search ";
        padding:                     12px 16px;
        border-radius:               100%;
        background-color:            @active-background; /* pywal accent */
        text-color:                  black;        /* light text on accent */
    }
    entry {
        enabled:                     true;
        expand:                      false;
        width:                       300px;
        padding:                     11px 15px; /* Adjusted padding for border */
        border:                      1px solid;   /* Define style and width */
        border-color:                @foreground; /* Then define color */
        border-radius:               100%;
        background-color:            @background; /* main background for field */
        text-color:                  @foreground; /* main text color */
        cursor:                      text;
        placeholder:                 "Wallpapers name";
        placeholder-color:           inherit;
    }
    dummy {
        expand:                      true;
        background-color:            transparent;
    }

    /*****----- Mode Switcher -----*****/
    mode-switcher{
        enabled:                     true;
        spacing:                     10px;
        background-color:            transparent;
        text-color:                  @foreground; /* from pywal */
    }
    button {
        width:                       80px;
        padding:                     0px; /* Adjusted padding for border */
        border:                      1px solid;   /* Define style and width */
        border-color:                @foreground; /* Then define color */
        border-radius:               100%;
        background-color:            @background; /* main background for button */
        text-color:                  @foreground; /* main text color */
        cursor:                      pointer;
    }
    button selected {
        background-color:            @selected-normal-background; /* pywal selected color */
        text-color:                  @background;                 /* light text on accent */
        border:                      0px solid;                   /* Define style and width */
        border-color:                @selected-normal-background; /* Then define color, same as bg */
    }

    /*****----- Listview -----*****/
    listview {
        enabled:                     true;
        columns:                     4;
        lines:                       3;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   false;
        layout:                      vertical;
        reverse:                     false;
        fixed-height:                true;
        fixed-columns:               true;
        spacing:                     10px;
        background-color:            transparent;
        text-color:                  @foreground; /* from pywal */
        cursor:                      "default";
    }

    /*****----- Elements -----*****/
    element {
        enabled:                     true;
        spacing:                     0px;
        padding:                     10px;
        border-radius:               25px;
        background-color:            transparent;
        text-color:                  @foreground; /* from pywal */
        cursor:                      pointer;
        orientation:                 vertical;
    }
    element normal.normal {
        background-color:            inherit; /* Should be transparent, showing listbox bg */
        text-color:                  inherit; /* Should be @foreground */
    }
    element normal.urgent {
        background-color:            @urgent-background; /* pywal urgent color */
        text-color:                  @background;        /* light text on accent */
    }
    element normal.active {
        background-color:            @active-background; /* pywal active color */
        text-color:                  @background;        /* light text on accent */
    }
    element selected.normal {
        background-color:            @selected-normal-background; /* pywal selected color */
        text-color:                  @background;                 /* light text on accent */
    }
    element selected.urgent {
        background-color:            @selected-urgent-background; /* pywal specific */
        text-color:                  @background;                 /* light text on accent */
    }
    element selected.active {
        background-color:            @selected-active-background; /* pywal specific */
        text-color:                  @background;                 /* light text on accent */
    }
    element-icon {
        background-color:            @selected-active-background;
        text-color:                  inherit;
        size:                        340px;
        cursor:                      inherit;
        border-radius:               25;
        vertical-align:0.5;
        horizontal-align:0.5;
        padding:-100px;
    }
    element-text {
        enabled:                     false;
    }

    /*****----- Message -----*****/
    message {
        background-color:            transparent;
    }
    textbox { /* This is for the message box if rofi shows one (e.g. help text) */
        padding:                     14px; /* Adjusted padding for border */
        border:                      1px solid;   /* Define style and width */
        border-color:                @foreground; /* Then define color */
        border-radius:               15px;
        background-color:            @background; /* main background */
        text-color:                  @foreground; /* main text color */
        vertical-align:              0.5;
        horizontal-align:            0.0;
    }
    error-message {
        padding:                     15px;
        border-radius:               15px;
        background-color:            @urgent-background; /* Use urgent color for error bg */
        text-color:                  @background;        /* Light text for contrast */
    }
  '';

  home.file.".config/rofi/themes/select-dark.rasi".text = ''
    @import "~/.cache/wal/colors-rofi-dark.rasi"

    * {
        font:                        "JetBrains Mono Nerd Font 20";
        background-color:        #333;
        border-radius:               25px;
        border-color:                @selected-normal-background;
    }

    window {
        transparency:                "real";
        location:                    center;
        anchor:                      center;
        fullscreen:                  false;
        width:                       800px;
        x-offset:                    0px;
        y-offset:                    0px;
        enabled:                     true;
        margin:                      0px;
        padding:                     0px;
        border:                      10px solid;
        cursor:                      "default";
    }

    mainbox {
        enabled:                     true;
        spacing:                     30px;
        margin:                      40px;
        padding:                     40px;
        border:                      0px solid;
        border-radius:               25px;
        children:                    [ "listview" ];
    }

    inputbar {
        enabled:                     true;
        spacing:                     10px;
        margin:                      0px 0px 20px 0px;
        padding:                     0px;
        border:                      0px;
        border-radius:               0px;
        background-color:            transparent;
        children:                    [ "textbox-prompt-colon", "dummy", "prompt" ];
    }

    dummy {
        background-color:            transparent;
        expand: true;
    }

    textbox-prompt-colon {
        enabled:                     true;
        expand:                      false;
        str:                         "MENU";
        padding:                     15px 20px;
        border-radius:               15px;
        background-color:            @background;
    }
    prompt {
        enabled:                     true;
        expand:                      false;
        padding:                     15px 20px;
        border-radius:               15px;
        background-color:            @background;
        text-color:                  @active;
    }

    message {
        enabled:                     true;
        margin:                      0px 100px;
        padding:                     20px;
        border:                      0px;
        border-radius:               15px;
    }
    textbox {
        vertical-align:              0.5;
        horizontal-align:            0.5;
        blink:                       true;
        markup:                      true;
    }
    error-message {
        padding:                     20px;
        border:                      0px solid;
        border-radius:               15px;
    }

    listview {
        enabled:                     true;
        columns:                     3;
        lines:                       1;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   false;
        layout:                      vertical;
        reverse:                     false;
        fixed-height:                true;
        fixed-columns:               true;
        spacing:                     20px;
        margin:                      0px;
        padding:                     10px;
        border:                      0px solid;
        border-radius:               15px;
        cursor:                      "default";
    }

    element {
        enabled:                     true;
        spacing:                     0px;
        margin:                      0px;
        padding:                     60px;
        border:                      0px solid;
        border-radius:               10px;
        cursor:                      pointer;
    }
    element-text {
        font:                        "JetBrains Mono Nerd Font 20";
        background-color:            transparent;
        text-color:                  inherit;
        cursor:                      inherit;
        vertical-align:              0.5;
        horizontal-align:            0.5;
    }
    element-icon {
        enabled:                     false;
    }
    element selected.normal {
        border-radius:               10px;
    }
  '';
}
