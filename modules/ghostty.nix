{ config, pkgs, ... }:

let
  fontName = "CaskaydiaCove Nerd Font Mono";
  fontSize = 15.0;
in
{
  xdg.configFile."ghostty/config".text = ''
    # Font
    font-family = "${fontName}"
    font-size = ${toString fontSize}
    # ghostty usually handles bold/italic automatically if the font supports them.

    # Window Appearance
    padding-x = 25
    padding-y = 25 # kitty's window_padding_width was for all sides; ghostty has x and y.
    opacity = 0.80
    # window-decorations = "none" # uncomment for no window decorations.
                                # options: "full", "transparent", "buttonless"

    # Cursor
    cursor-trail-length = 3 # this was cursor_trail in kitty
    # For kitty's cursor_trail_decay 0.1 0.4:
    # ghostty uses separate decay factors. you might need to tweak these!
    cursor-trail-scale-decay = 0.1
    cursor-trail-opacity-decay = 0.4

    # Other
    # confirm-close = false # uncomment if you don't want a close confirmation.
  '';
}

