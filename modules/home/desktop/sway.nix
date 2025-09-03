{
  pkgs,
  lib,
  config,
  ...
}: let
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

      keybindings = let
        modifier = config.wayland.windowManager.sway.config.modifier;
      in
        lib.mkOptionDefault {
          # Screenshots
          "Print" = "exec grim -g \"$(slurp)\" - | wl-copy";
          "${modifier}+Print" = "exec grim - | wl-copy";

          # SwayOSD controls
          "XF86AudioRaiseVolume" = "exec swayosd-client --output-volume raise";
          "XF86AudioLowerVolume" = "exec swayosd-client --output-volume lower";
          "XF86AudioMute" = "exec swayosd-client --output-volume mute-toggle";
          "XF86AudioMicMute" = "exec swayosd-client --input-volume mute-toggle";
          "XF86MonBrightnessUp" = "exec swayosd-client --brightness raise";
          "XF86MonBrightnessDown" = "exec swayosd-client --brightness lower";
          "--release Caps_Lock" = "exec swayosd-client --caps-lock";
        };
    };
  };

  home.packages = with pkgs; [
    wl-clipboard
    grim
    slurp
    libsForQt5.qt5ct
  ];
}
