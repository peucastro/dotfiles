{pkgs, ...}: {
  home.packages = [
    # Communication
    pkgs.webcord-vencord
    pkgs.slack
    pkgs.telegram-desktop

    # Browsers
    pkgs.firefox
    pkgs.ungoogled-chromium

    # Multimedia
    pkgs.audacity
    pkgs.gimp
    pkgs.loupe
    pkgs.obs-studio
    pkgs.pavucontrol
    pkgs.vlc
    pkgs.kdePackages.kdenlive
    pkgs.spotify
    pkgs.scrcpy
    pkgs.zoom

    # Office
    pkgs.calibre
    pkgs.evince
    pkgs.libreoffice
    pkgs.obsidian
    pkgs.qalculate-gtk

    # Utility
    pkgs.gitkraken
    pkgs.hoppscotch
    pkgs.qbittorrent
    pkgs.mission-center
    pkgs.postman
    pkgs.snapper-gui
    pkgs.veracrypt
    pkgs.gparted
    pkgs.nautilus

    # Editors
    pkgs.gnome-text-editor
    pkgs.android-studio
    pkgs.jetbrains.clion
    pkgs.jetbrains.idea-ultimate
    pkgs.jetbrains.phpstorm
    pkgs.jetbrains.pycharm-professional
  ];

  xdg.mimeApps.defaultApplications = {
    # Image viewer associations
    "image/jpeg" = ["org.gnome.Loupe.desktop"];
    "image/png" = ["org.gnome.Loupe.desktop"];
    "image/gif" = ["org.gnome.Loupe.desktop"];
    "image/webp" = ["org.gnome.Loupe.desktop"];
    "image/tiff" = ["org.gnome.Loupe.desktop"];
    "image/bmp" = ["org.gnome.Loupe.desktop"];
    "image/vnd.microsoft.icon" = ["org.gnome.Loupe.desktop"];
    "image/svg+xml" = ["org.gnome.Loupe.desktop"];
    "image/svg+xml-compressed" = ["org.gnome.Loupe.desktop"];
    "image/avif" = ["org.gnome.Loupe.desktop"];
    "image/heic" = ["org.gnome.Loupe.desktop"];
    "image/jxl" = ["org.gnome.Loupe.desktop"];

    # Document viewer associations
    "application/pdf" = ["org.gnome.Evince.desktop"];
    "application/x-bzpdf" = ["org.gnome.Evince.desktop"];
    "application/x-gzpdf" = ["org.gnome.Evince.desktop"];
    "application/x-xzpdf" = ["org.gnome.Evince.desktop"];
    "application/postscript" = ["org.gnome.Evince.desktop"];
    "application/oxps" = ["org.gnome.Evince.desktop"];
    "application/vnd.ms-xpsdocument" = ["org.gnome.Evince.desktop"];
    "image/vnd.djvu" = ["org.gnome.Evince.desktop"];

    # Text editor associations
    "text/plain" = ["org.gnome.TextEditor.desktop"];
    "text/markdown" = ["org.gnome.TextEditor.desktop"];
    "application/x-zerosize" = ["org.gnome.TextEditor.desktop"];

    # Video player associations
    "video/mp4" = ["vlc.desktop"];
    "video/x-matroska" = ["vlc.desktop"];
    "video/mpeg" = ["vlc.desktop"];
    "video/ogg" = ["vlc.desktop"];
    "video/quicktime" = ["vlc.desktop"];
    "video/webm" = ["vlc.desktop"];
    "video/x-ms-wmv" = ["vlc.desktop"];
    "video/x-msvideo" = ["vlc.desktop"];
    "video/x-flv" = ["vlc.desktop"];
    "video/3gpp" = ["vlc.desktop"];

    # Audio player associations
    "audio/mp3" = ["vlc.desktop"];
    "audio/mpeg" = ["vlc.desktop"];
    "audio/flac" = ["vlc.desktop"];
    "audio/ogg" = ["vlc.desktop"];
    "audio/wav" = ["vlc.desktop"];
    "audio/webm" = ["vlc.desktop"];
    "audio/x-ms-wma" = ["vlc.desktop"];
    "audio/aac" = ["vlc.desktop"];
    "audio/x-m4a" = ["vlc.desktop"];
  };
}
