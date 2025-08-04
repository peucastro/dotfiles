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
    texstudio
    obsidian
    qalculate-gtk

    # Utility
    dconf-editor
    gnome-disk-utility
    gitkraken
    qbittorrent
    mission-center
    postman

    # Editors
    android-studio
    jetbrains.clion
    jetbrains.idea-ultimate
    jetbrains.phpstorm
    jetbrains.pycharm-professional
  ];
}
