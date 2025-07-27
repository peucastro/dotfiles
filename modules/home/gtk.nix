{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
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
    };
    theme = {
      name = "Adwaita Dark";
    };
    iconTheme = {
      name = "Adwaita Dark";
    };
  };
}
