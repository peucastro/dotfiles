{pkgs, ...}: let
  colors = (import ./colors.nix).colors;
in {
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;

    config = {
      modifier = "Mod4";
      terminal = "ghostty";
      menu = "fuzzel";

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

      colors = {
        background = colors.background;

        focused = {
          border = colors.focused;
          background = colors.background-dim;
          text = colors.foreground;
          indicator = colors.blue;
          childBorder = colors.focused;
        };

        unfocused = {
          border = colors.unfocused;
          background = colors.background;
          text = colors.foreground-alt;
          indicator = colors.gray;
          childBorder = colors.unfocused;
        };

        urgent = {
          border = colors.urgent;
          background = colors.background;
          text = colors.foreground;
          indicator = colors.red;
          childBorder = colors.urgent;
        };
      };

      input = {
        "*" = {
          xkb_layout = "pt";
          natural_scroll = "enabled";
          tap = "enabled";
          dwt = "enabled";
          accel_profile = "flat";
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
