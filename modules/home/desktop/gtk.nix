{pkgs, ...}: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    dconf
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
    iconTheme = {name = "Adwaita";};
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-button-images = true;
      gtk-menu-images = true;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };
}
