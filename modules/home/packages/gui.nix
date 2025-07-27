{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Communication
    webcord-vencord

    # Multimedia
    audacity
    gimp
    obs-studio
    pavucontrol
    vlc

    # Office
    libreoffice
    obsidian
    gnome-calculator

    # Utility
    dconf-editor
    ghostty
    gnome-disk-utility
    mission-center
  ];
}
