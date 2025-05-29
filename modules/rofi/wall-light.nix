{
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
        background-color:            #fefefe;
        text-color:                  #151514;
        alternate-normal-background: transparent;
        border-color:transparent;
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
        background-color:            #fefefe;
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
        text-color:                  #151514; /* from pywal */
        orientation:                 horizontal;
        children:                    [ "idk", "dummy", "mode-switcher" ];
    }
    idk {
        enabled: true;
        spacing:                     10px;
        padding:                     10px 60px;
        background-color:            transparent;
        text-color:                  #151514; /* from pywal */
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
        border-color:                #151514; /* Then define color */
        border-radius:               100%;
        background-color:            #fefefe; /* main background for field */
        text-color:                  #151514; /* main text color */
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
        text-color:                  #151514; /* from pywal */
    }
    button {
        width:                       80px;
        padding:                     0px; /* Adjusted padding for border */
        border:                      1px solid;   /* Define style and width */
        border-color:                #151514; /* Then define color */
        border-radius:               100%;
        background-color:            #fefefe; /* main background for button */
        text-color:                  #151514; /* main text color */
        cursor:                      pointer;
    }
    button selected {
        background-color:            @selected-normal-background; /* pywal selected color */
        text-color:                  #fefefe;                 /* light text on accent */
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
        text-color:                  #151514; /* from pywal */
        cursor:                      "default";
    }

    /*****----- Elements -----*****/
    element {
        enabled:                     true;
        spacing:                     0px;
        padding:                     10px;
        border-radius:               25px;
        background-color:            transparent;
        text-color:                  #151514; /* from pywal */
        cursor:                      pointer;
        orientation:                 vertical;
    }
    element normal.normal {
        background-color:            inherit; /* Should be transparent, showing listbox bg */
        text-color:                  inherit; /* Should be #151514 */
    }
    element normal.urgent {
        background-color:            @urgent-background; /* pywal urgent color */
        text-color:                  #fefefe;        /* light text on accent */
    }
    element normal.active {
        background-color:            @active-background; /* pywal active color */
        text-color:                  #fefefe;        /* light text on accent */
    }
    element selected.normal {
        background-color:            @selected-normal-background; /* pywal selected color */
        text-color:                  #fefefe;                 /* light text on accent */
    }
    element selected.urgent {
        background-color:            @selected-urgent-background; /* pywal specific */
        text-color:                  #fefefe;                 /* light text on accent */
    }
    element selected.active {
        background-color:            @selected-active-background; /* pywal specific */
        text-color:                  #fefefe;                 /* light text on accent */
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
    element alternate.normal {
      background: transparent;
    }

    /*****----- Message -----*****/
    message {
        background-color:            transparent;
    }
    textbox { /* This is for the message box if rofi shows one (e.g. help text) */
        padding:                     14px; /* Adjusted padding for border */
        border:                      1px solid;   /* Define style and width */
        border-color:                #151514; /* Then define color */
        border-radius:               15px;
        background-color:            #fefefe; /* main background */
        text-color:                  #151514; /* main text color */
        vertical-align:              0.5;
        horizontal-align:            0.0;
    }
    error-message {
        padding:                     15px;
        border-radius:               15px;
        background-color:            @urgent-background; /* Use urgent color for error bg */
        text-color:                  #fefefe;        /* Light text for contrast */
    }
  '';
}
