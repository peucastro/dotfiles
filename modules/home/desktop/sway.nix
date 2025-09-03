{pkgs, ...}: {
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    config = {
      terminal = "ghostty";
      menu = "fuzzel";
      modifier = "Mod4";

      gaps = {
        inner = 8;
        outer = 2;
        smartGaps = true;
      };

      window = {
        border = 2;
        titlebar = false;
        hideEdgeBorders = "smart";
      };

      input = {
        "*" = {
          xkb_layout = "pt";
          natural_scroll = "enabled";
          tap = "enabled";
          dwt = "enabled";
        };
      };
    };
  };

  home.packages = with pkgs; [
    wl-clipboard
    grim
    slurp
    brightnessctl
    wlsunset
    libsForQt5.qt5ct
  ];
}
