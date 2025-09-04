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
        terminal = config.wayland.windowManager.sway.config.terminal;
        menu = config.wayland.windowManager.sway.config.menu;
        fileManager = "nautilus --new-window";
      in
        lib.mkOptionDefault {
          # Basics
          "${modifier}+Return" = "exec ${terminal}";
          "${modifier}+q" = "kill";
          "${modifier}+m" = "exec ${fileManager}";
          "${modifier}+d" = "exec ${menu}";
          "Control+Alt+Delete" = "exec wlogout";

          # Power
          "${modifier}+Shift+x" = "exec loginctl lock-session";
          "${modifier}+Shift+s" = "exec loginctl lock-session & systemctl suspend";

          # Move your focus around
          "${modifier}+Left" = "focus left";
          "${modifier}+Down" = "focus down";
          "${modifier}+Up" = "focus up";
          "${modifier}+Right" = "focus right";

          # Move the focused window
          "${modifier}+Shift+Left" = "move left";
          "${modifier}+Shift+Down" = "move down";
          "${modifier}+Shift+Up" = "move up";
          "${modifier}+Shift+Right" = "move right";

          # Switch to workspace
          "${modifier}+1" = "workspace number 1";
          "${modifier}+2" = "workspace number 2";
          "${modifier}+3" = "workspace number 3";
          "${modifier}+4" = "workspace number 4";
          "${modifier}+5" = "workspace number 5";
          "${modifier}+6" = "workspace number 6";
          "${modifier}+7" = "workspace number 7";
          "${modifier}+8" = "workspace number 8";
          "${modifier}+9" = "workspace number 9";
          "${modifier}+0" = "workspace number 10";

          # Move focused container to workspace
          "${modifier}+Shift+1" = "move container to workspace number 1; workspace number 1";
          "${modifier}+Shift+2" = "move container to workspace number 2; workspace number 2";
          "${modifier}+Shift+3" = "move container to workspace number 3; workspace number 3";
          "${modifier}+Shift+4" = "move container to workspace number 4; workspace number 4";
          "${modifier}+Shift+5" = "move container to workspace number 5; workspace number 5";
          "${modifier}+Shift+6" = "move container to workspace number 6; workspace number 6";
          "${modifier}+Shift+7" = "move container to workspace number 7; workspace number 7";
          "${modifier}+Shift+8" = "move container to workspace number 8; workspace number 8";
          "${modifier}+Shift+9" = "move container to workspace number 9; workspace number 9";
          "${modifier}+Shift+0" = "move container to workspace number 10; workspace number 10";

          # Split
          "${modifier}+b" = "splith";
          "${modifier}+v" = "splitv";

          # Switch layout styles
          "${modifier}+s" = "layout stacking";
          "${modifier}+w" = "layout tabbed";
          "${modifier}+e" = "layout toggle split";

          # Make the current focus fullscreen
          "${modifier}+f" = "fullscreen";

          # Toggle the current focus between tiling and floating mode
          "${modifier}+Shift+space" = "floating toggle";

          # Swap focus between the tiling area and the floating area
          "${modifier}+space" = "focus mode_toggle";

          # Move focus to the parent container
          "${modifier}+a" = "focus parent";

          # Move the currently focused window to the scratchpad
          "${modifier}+Shift+minus" = "move scratchpad";

          # Show the next scratchpad window or hide the focused scratchpad window.
          "${modifier}+minus" = "scratchpad show";

          # Media control
          "${modifier}+Shift+p" = "exec playerctl play-pause";
          "${modifier}+Shift+n" = "exec playerctl next";
          "${modifier}+Shift+b" = "exec playerctl previous";

          # Clipboard history
          "${modifier}+c" = "exec cliphist list | ${menu} --dmenu | cliphist decode | wl-copy";

          # Screenshots
          "Print" = "exec grim -g \"$(slurp)\" - | wl-copy";
          "${modifier}+Print" = "exec grim - | wl-copy";

          # Cycle wallpaper
          "${modifier}+Shift+w" = "exec wpaperctl next";

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

  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    size = 24;
  };

  home.packages = with pkgs; [
    evince
    gnome-text-editor
    grim
    loupe
    nautilus
    slurp
    wl-clipboard
  ];
}
