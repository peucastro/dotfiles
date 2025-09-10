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
    loupe
    obs-studio
    pavucontrol
    vlc
    kdePackages.kdenlive
    spotify
    scrcpy
    zoom

    # Office
    calibre
    evince
    libreoffice
    obsidian
    qalculate-gtk

    # Utility
    gitkraken
    hoppscotch
    qbittorrent
    mission-center
    postman
    snapper-gui
    nautilus

    # Editors
    gnome-text-editor
    android-studio
    jetbrains.clion
    jetbrains.idea-ultimate
    jetbrains.phpstorm
    jetbrains.pycharm-professional
  ];

  xdg.mimeApps.defaultApplications = {
    "image/png" = ["loupe.desktop"];
    "image/jpeg" = ["loupe.desktop"];
    "image/webp" = ["loupe.desktop"];
    "application/pdf" = ["evince.desktop"];
    "text/plain" = ["g-edit.desktop"];
    "text/markdown" = ["g-edit.desktop"];
    "video/mp4" = ["vlc.desktop"];
    "video/x-matroska" = ["vlc.desktop"];
  };
}
