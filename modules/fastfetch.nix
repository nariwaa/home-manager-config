{ config, pkgs, lib, ... }:

{
  # Create the config file directly at the standard location
  xdg.configFile."fastfetch/config.jsonc".text = ''
    {
      "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
      "modules": [
        "break",
        {
          "type": "custom",
          "format": "\u001b[90m┌────────────────────────Hardware────────────────────────┐"
        },
        {
          "type": "title",
          "key": " PC",
          "keyColor": "green"
        },
        {
          "type": "host",
          "key": "│ ├󰚗",
          "keyColor": "green"
        },
        {
          "type": "cpu",
          "key": "│ ├",
          "showPeCoreCount": true,
          "keyColor": "green"
        },
        {
          "type": "gpu",
          "key": "│ ├",
          "keyColor": "green"
        },
        {
          "type": "disk",
          "key": "│ ├",
          "keyColor": "green"
        },
        {
          "type": "memory",
          "key": "└ └",
          "keyColor": "green"
        },
        {
          "type": "custom",
          "format": "\u001b[90m└────────────────────────────────────────────────────────┘"
        },
        "break",
        {
          "type": "custom",
          "format": "\u001b[90m┌────────────────────────Software────────────────────────┐"
        },
        {
          "type": "os",
          "key": " OS",
          "keyColor": "blue"
        },
        {
          "type": "kernel",
          "key": "│ ├",
          "keyColor": "blue"
        },
        {
          "type": "uptime",
          "key": "│ ├󱫠",
          "keyColor": "blue"
        },
        {
          "type": "packages",
          "key": "│ ├󰏖",
          "keyColor": "blue"
        },
        {
          "type": "de",
          "key": " DE",
          "keyColor": "blue"
        },
        {
          "type": "lm",
          "key": "│ ├",
          "keyColor": "blue"
        },
        {
          "type": "wm",
          "key": "│ ├",
          "keyColor": "blue"
        },
        {
          "type": "wmtheme",
          "key": "│ ├󰉼",
          "keyColor": "blue"
        },
        {
          "type": "gpu",
          "key": "└ └󰍛",
          "format": "{3}",
          "keyColor": "blue"
        },
        {
          "type": "custom",
          "format": "\u001b[90m└────────────────────────────────────────────────────────┘"
        },
        "break",
        {
          "type": "custom",
          "format": "\u001b[90m├───────────────── \u001b[91m◖◗ \u001b[92m◖◗ \u001b[93m◖◗ \u001b[94m◖◗ \u001b[95m◖◗ \u001b[96m◖◗ \u001b[97m◖◗\u001b[0m\u001b[90m ─────────────────┤"
        }
      ]
    }
  '';
}
