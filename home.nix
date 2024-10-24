{ config, pkgs, ... }:

{
  home.username = "ayaya";
  home.homeDirectory = "/home/ayaya";
  home.stateVersion = "23.11"; 

#  home.packages = [
  home.packages = with pkgs; [
    dconf
    breeze-icons
  ];

    gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
      };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
      };
    cursorTheme = {
      name = "Adwaita";
      package = pkgs.bibata-cursors;
      };
    };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = [ "thunar.desktop" ];
      "application/x-gnome-saved-search" = [ "thunar.desktop" ];
    };
  };

  programs.starship.enable = true;
  programs.starship.settings = {
    add_newline = true;
    format = "┌─$cmd_duration$username@$hostname$all[>](bright-white bold)
└─$character";
    shell = {
      disabled = true;
    };
    hostname = {
      ssh_only = false;
      format = "[$hostname]($style)[\\]-< ](bright-white bold)";
    };
    username = {
      format = "[\\[](bright-white bold)[$user]($style)";
      show_always = true;
      style_root = "bright-red bold";
    };
    cmd_duration = {
      format = "[\\[](bright-blue bold)[$duration](bright-blue bold)[\\]](bright-blue bold)[-](bright-white bold)";
    };
    line_break = {
      disabled = true;
      };
  };
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ayaya/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
