{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "default-web-browser" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "image/png" = "loupe.desktop";
      "image/jpeg" = "loupe.desktop";
      "image/webp" = "loupe.desktop";
      "application/pdf" = "evince.desktop";
      "text/plain" = "g-edit.desktop";
      "text/markdown" = "g-edit.desktop";
      "video/mp4" = "vlc.desktop";
      "video/x-matroska" = "vlc.desktop";
    };
  };

  environment.sessionVariables = {
    XDG_CURRENT_DESKTOP = "sway";
    XDG_SESSION_TYPE = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
  };
}
