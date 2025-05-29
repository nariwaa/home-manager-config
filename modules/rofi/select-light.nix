{
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
}
