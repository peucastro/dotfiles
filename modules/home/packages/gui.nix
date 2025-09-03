{pkgs, ...}: {
  home.packages = with pkgs; [
    # Communication
    webcord-vencord
    slack
    telegram-desktop

    # Browsers
    firefox
    ungoogled-chromium

    # Multimedia
    audacity
    gimp
    obs-studio
    pavucontrol
    vlc
    kdePackages.kdenlive
    spotify
    scrcpy
    stremio
    zoom

    # Office
    calibre
    libreoffice
    obsidian
    qalculate-gtk

    # Utility
    gnome-disk-utility
    gitkraken
    hoppscotch
    qbittorrent
    mission-center
    postman
    snapper-gui

    # Editors
    android-studio
    jetbrains.clion
    jetbrains.idea-ultimate
    jetbrains.phpstorm
    jetbrains.pycharm-professional
  ];
}
