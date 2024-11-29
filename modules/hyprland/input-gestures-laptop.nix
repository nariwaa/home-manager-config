{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {

      # Gesture settings
      gestures = {
        workspace_swipe = true;
        workspace_swipe_distance = 200;
        workspace_swipe_fingers = 3;
        workspace_swipe_forever = true;
        workspace_swipe_invert = true;
      };

      # Input settings
      input = {
        touchpad = {
          natural_scroll = true;
          clickfinger_behavior = true;
        };
        scroll_factor = 1;
        follow_mouse = 1;
        kb_layout = "us";
        kb_options = "caps:escape, grp:alt_space_toggle";
        kb_variant = "altgr-intl";
        sensitivity = 0;
      };
    };
  };
}
