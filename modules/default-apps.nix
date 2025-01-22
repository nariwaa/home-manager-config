{ config, pkgs, ... }:
{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # Web browser
      "text/html" = ["brave.desktop"];
      "application/pdf" = ["brave.desktop"];
      "x-scheme-handler/http" = ["brave.desktop"];
      "x-scheme-handler/https" = ["brave.desktop"];
      "x-scheme-handler/about" = ["brave.desktop"];
      "x-scheme-handler/unknown" = ["brave.desktop"];

      # Image viewer
      "image/jpeg" = ["qimgv.desktop"];
      "image/png" = ["qimgv.desktop"];
      "image/gif" = ["qimgv.desktop"];
      "image/webp" = ["qimgv.desktop"];
      "image/svg+xml" = ["qimgv.desktop"];
      "image/tiff" = ["qimgv.desktop"];
      "image/bmp" = ["qimgv.desktop"];

      # File manager
      "inode/directory" = ["thunar.desktop"];

      # Video player
      "video/mp4" = ["mpv.desktop"];
      "video/mpeg" = ["mpv.desktop"];
      "video/webm" = ["mpv.desktop"];
      "video/x-matroska" = ["mpv.desktop"];
      "video/x-msvideo" = ["mpv.desktop"];

      # Text editor
      "text/plain" = ["kitty-nvim.desktop"];
    };
  };

  # Create a desktop entry for launching nvim in kitty
  xdg.desktopEntries.kitty-nvim = {
    name = "Neovim in Kitty";
    genericName = "Text Editor";
    exec = "kitty nvim %F";
    terminal = false;
    categories = [ "Utility" "TextEditor" ];
    mimeType = [ "text/plain" ];
  };
}
