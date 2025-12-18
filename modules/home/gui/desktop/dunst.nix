let
  inherit (import ./colors.nix) colors;
in
  {pkgs, ...}: {
    services.dunst = {
      enable = true;
      iconTheme = {
        name = "Adwaita";
        package = pkgs.adwaita-icon-theme;
        size = "32x32";
      };

      settings = {
        global = {
          width = 400;
          height = 150;
          offset = "15x15";
          frame_color = "#${colors.border}";
          frame_width = 2;
          corner_radius = 6;
          font = "Inter 12";
          markup = "full";
          idle_threshold = 120;
          separator_color = "#${colors.unfocused}";
          notification_limit = 5;
          padding = 12;
          text_icon_padding = 8;
          progress_bar = true;
          progress_bar_height = 8;
          progress_bar_min_width = 150;
          progress_bar_max_width = 300;
          progress_bar_frame_width = 1;
        };

        urgency_low = {
          background = "#${colors.background-dim}";
          foreground = "#${colors.foreground-alt}";
          timeout = 3;
          highlight = "#${colors.blue}";
        };

        urgency_normal = {
          background = "#${colors.background-dim}";
          foreground = "#${colors.foreground}";
          timeout = 5;
          highlight = "#${colors.focused}";
        };

        urgency_critical = {
          background = "#${colors.background-dim}";
          foreground = "#${colors.foreground}";
          timeout = 0;
          frame_color = "#${colors.urgent}";
          highlight = "#${colors.urgent}";
        };

        volume = {
          appname = "volume";
          timeout = 2;
          highlight = "#${colors.green}";
        };

        brightness = {
          appname = "brightness";
          timeout = 2;
          highlight = "#${colors.yellow}";
        };

        keyboard = {
          appname = "keyboard";
          timeout = 2;
          highlight = "#${colors.blue}";
        };
      };
    };
  }
