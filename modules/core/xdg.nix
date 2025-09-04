{pkgs, ...}: {
  xdg.portal = {
    enable = true;
    wlr = {
      enable = true;
      settings = {
        screencast = {
          chooser_type = "simple";
          chooser_cmd = "${pkgs.slurp}/bin/slurp -f %o -or";
        };
      };
    };

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];

    config = {
      common = {
        default = [
          "wlr"
          "gtk"
        ];
      };
    };
  };

  xdg.mime = {
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
}
