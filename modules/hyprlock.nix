{ config, lib, pkgs, ... }:
{
  xdg.configFile."hypr/hyprlock.conf".text = let
    colors = config.colorScheme.colors;
  in ''
    # Source colors from pywal
    source = ~/.cache/wal/colors-hyprland.conf

    # BACKGROUND
    background {
        monitor = 
        path = /tmp/current.png
        blur_passes = 3
        contrast = 0.8916
        brightness = 0.8172
        vibrancy = 0.1696
        vibrancy_darkness = 0.0
        noise = 0
    }

    # GENERAL
    general {
        no_fade_in = false
        grace = 0
        disable_loading_bar = true
        hide_cursor = true
        ignore_empty_input = true
    }

    # INPUT FIELD
    input-field {
        monitor =
        size = 250, 60
        outline_thickness = 2
        dots_size = 0.2
        dots_spacing = 0.2
        dots_center = true
        outer_color = rgba(0, 0, 0, 0)
        inner_color = rgba(0, 0, 0, 0.5)
        font_color = rgb(200, 200, 200)
        fade_on_empty = false
        font_family = JetBrains Mono Nerd Font Mono
        placeholder_text = <span foreground="##cdd6f4">    $USER</span>
        hide_input = false
        position = 0, -130
        halign = center
        valign = center
    }

    # TIME
    label {
        monitor =
        text = cmd[update:1000] echo "$(date +"%H:%M%p:%S")"
        color = $foreground
        font_size = 120
        font_family = JetBrains Mono Nerd Font Mono ExtraBold
        position = 0, 60
        halign = center
        valign = center
    }

    # Cool text
    label {
        monitor =
        text = cmd[] shuf -n 1 /sync/wall/splash.txt
        color = $foreground
        font_size = 25
        font_family = JetBrains Mono Nerd Font Mono
        position = 0, -50
        halign = center
        valign = center
    }
  '';
}
