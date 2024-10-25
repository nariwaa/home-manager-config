{ config, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    style = ''
      @import url("${config.home.homeDirectory}/.cache/wal/colors-waybar.css");
      * {
        border: none;
        border-radius: 0;
        font-family: roboto;
        font-weight: bold;
        min-height: 20px;
      }

      window#waybar {
        background: transparent;
      }

      window#waybar.hidden {
        opacity: 0.2;
      }

      #workspaces {
        margin-right: 8px;
        border-radius: 10px;
        transition: none;
        background: @background;
      }

      #workspaces button {
        transition: none;
        color: @color7;
        background: transparent;
        padding: 5px;
        font-size: 18px;
      }

      #workspaces button.persistent {
        color: @color7;
        font-size: 12px;
      }

      #workspaces button:hover {
        transition: none;
        box-shadow: inherit;
        text-shadow: inherit;
        border-radius: inherit;
        color: @background;
        background: @color7;
      }

      #workspaces button.active {
        background: @color4;
        color: @background;
        border-radius: inherit;
      }

      #pulseaudio {
        margin-right: 8px;
        padding-left: 1px;
        padding-right: 1px;
        border-radius: 10px;
        transition: none;
        color: @foreground;
        background: @background;
      }

      #pulseaudio.muted {
        background-color: @color1;
        color: @background;
      }

      #custom-mem {
        margin-right: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: @foreground;
        background: @background;
      }

      #cpu {
        margin-right: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: @foreground;
        background: @background;
      }

      #temperature {
        margin-right: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: @foreground;
        background: @background;
      }

      #temperature.critical {
        background-color: @color1;
        color: @background;
      }

      #backlight {
        margin-right: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: @foreground;
        background: @background;
      }

      #battery {
        margin-right: 0px;
        padding-left: 12px;
        padding-right: 10px;
        border-radius: 10px;
        transition: none;
        color: @foreground;
        background: @background;
      }

      #battery.charging {
        color: @background;
        background-color: @color2;
      }

      #battery.warning:not(.charging) {
        background-color: @color3;
        color: @background;
      }

      #battery.critical:not(.charging) {
        background-color: @color1;
        color: @foreground;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      #tray {
        margin-left: 8;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: @foreground;
        background: @background;
      }

      @keyframes blink {
        to {
          background-color: @foreground;
          color: @background;
        }
      }

      #clock {
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: @foreground;
        background: @background;
      }

      #custom-distro {
        margin-right: 16px;
        padding-left: 11px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        color: @foreground;
        background: @background;
      }
    '';

    settings = [{
      layer = "top";
      margin = "10 10 0 10";
      modules-center = [ "clock" ];
      modules-left = [
        "custom/distro"
        "hyprland/workspaces"
        "hyprland/submap"
      ];
      modules-right = [
        "pulseaudio"
        "custom/mem"
        "cpu"
        "temperature"
        "backlight"
        "battery"
        "tray"
      ];

      "backlight" = {
        device = "intel_backlight";
        format = "{percent}% 💡";
      };

      "battery" = {
        format = "{capacity}% {icon}";
        format-alt = "{time} {icon}";
        format-charging = "{capacity}% 🔋";
        format-icons = [
          "🪫"
          "🪫"
          "🪫"
          "🪫"
          "🔋"
          "🔋"
          "🔋"
          "🔋"
          "⚡"
          "⚡"
        ];
        format-plugged = "{capacity}% ⚡";
        states = {
          critical = 15;
          warning = 30;
        };
      };

      "clock" = {
        format = "{:%a %d %b | %H:%M}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      };

      "cpu" = {
        format = "{usage}% 🔳";
        interval = 2;
        min-length = 6;
      };

      "custom/mem" = {
        exec = "free -h | awk '/Mem:/{printf $3}'";
        format = "{} 💾";
        interval = 3;
        tooltip = false;
      };

      "hyprland/workspaces" = {
        "disable-scroll" = true;
      };

      "pulseaudio" = {
        format = "{volume}% {icon}";
        format-bluetooth = "{volume}% {icon}🔊 {format_source}";
        format-bluetooth-muted = "🔇 {icon} 🔇 {format_source}";
        format-icons = {
          car = "🔊";
          default = [
            "🔈"
            "🔉"
            "🔊"
          ];
        };
        format-muted = "🔇 muted";
        format-source = "{volume}% ";
        min-length = 13;
        on-click = "pavucontrol";
        reverse-scrolling = 1;
      };

      "temperature" = {
        critical-threshold = 80;
        format = "{temperatureC}°C {icon}";
        format-icons = [
          ""
          ""
          ""
          ""
          ""
        ];
        tooltip = true;
      };

      "tray" = {
        icon-size = 16;
        spacing = 0;
      };

      "custom/distro" = {
        format = "";
        min-length = 2;
      };
    }];
  };
}
