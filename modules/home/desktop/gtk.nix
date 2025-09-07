{pkgs, ...}: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    dconf
    font-awesome
    inter
    noto-fonts-emoji
    twemoji-color-font
    nerd-fonts.fira-code
    nerd-fonts.hack
    nerd-fonts.meslo-lg
    nerd-fonts.jetbrains-mono
    nerd-fonts.caskaydia-cove
    nerd-fonts.symbols-only
  ];

  gtk = {
    enable = true;
    font = {
      name = "Inter";
      size = 12;
      package = pkgs.inter;
    };
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.gnome-icon-theme;
    };
    cursorTheme = {
      name = "Adwaita";
      package = pkgs.gnome-themes-extra;
      size = 24;
    };
    gtk2.extraConfig = "gtk-theme-name = \"Adwaita-dark\"\ngtk-icon-theme-name = \"Adwaita\"\ngtk-font-name = \"Inter 12\"\ngtk-cursor-theme-name = \"Adwaita\"\ngtk-cursor-theme-size = 24\n";
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-theme-name = "Adwaita-dark";
      gtk-icon-theme-name = "Adwaita";
      gtk-font-name = "Inter 12";
      gtk-cursor-theme-name = "Adwaita";
      gtk-cursor-theme-size = 24;
      gtk-button-images = true;
      gtk-menu-images = true;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-theme-name = "Adwaita-dark";
      gtk-icon-theme-name = "Adwaita";
      gtk-font-name = "Inter 12";
      gtk-cursor-theme-name = "Adwaita";
      gtk-cursor-theme-size = 24;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      "gtk-theme" = "Adwaita-dark";
      "icon-theme" = "Adwaita";
      "color-scheme" = "prefer-dark";
    };
  };

  home.sessionVariables = {
    GTK_THEME = "Adwaita:dark";
    GDK_BACKEND = "wayland";
    CLUTTER_BACKEND = "wayland";
    NIXOS_OZONE_WL = 1;
    OZONE_PLATFORM = "wayland";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    MOZ_ENABLE_WAYLAND = 1;
  };
}
