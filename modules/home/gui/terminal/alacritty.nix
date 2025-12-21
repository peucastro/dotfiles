let
  inherit (import ../desktop/colors.nix) colors;
in {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.95;
        padding = {
          x = 8;
          y = 8;
        };
        blur = true;
        startup_mode = "Maximized";
      };
      scrolling.history = 50000;
      font = {
        normal = {
          family = "FiraCode Nerd Font Mono";
          style = "Regular";
        };
        size = 13.5;
      };
      colors = {
        primary = {
          background = "#${colors.background-dim}";
          foreground = "#${colors.white}";
          dim_foreground = "#${colors.foreground-dim}";
          bright_foreground = "#${colors.foreground-alt}";
        };
        cursor = {
          text = "#${colors.background}";
          cursor = "#${colors.focused}";
        };
        vi_mode_cursor = {
          text = "#${colors.background}";
          cursor = "#${colors.unfocused}";
        };
        search = {
          matches = {
            foreground = "#${colors.background}";
            background = "#${colors.red}";
          };
          focused_match = {
            foreground = "#${colors.background}";
            background = "#${colors.yellow}";
          };
        };
        hints = {
          start = {
            foreground = "#${colors.background}";
            background = "#${colors.yellow}";
          };
          end = {
            foreground = "#${colors.background}";
            background = "#${colors.red}";
          };
        };
        line_indicator = {
          foreground = "#${colors.orange}";
          background = "#${colors.background-alt}";
        };
        footer_bar = {
          foreground = "#${colors.background}";
          background = "#${colors.foreground}";
        };
        selection = {
          text = "#${colors.background}";
          background = "#${colors.selection}";
        };
        normal = {
          black = "#${colors.black}";
          red = "#${colors.red}";
          green = "#${colors.green}";
          yellow = "#${colors.yellow}";
          blue = "#${colors.blue}";
          magenta = "#${colors.magenta}";
          cyan = "#${colors.cyan}";
          white = "#${colors.white}";
        };
        bright = {
          black = "#${colors.gray}";
          red = "#${colors.orange}";
          green = "#${colors.green}";
          yellow = "#${colors.yellow}";
          blue = "#${colors.blue}";
          magenta = "#${colors.magenta}";
          cyan = "#${colors.cyan}";
          white = "#${colors.foreground}";
        };
        dim = {
          black = "#${colors.background-dim}";
          red = "#${colors.unfocused}";
          green = "#${colors.green}";
          yellow = "#${colors.selection}";
          blue = "#${colors.blue}";
          magenta = "#${colors.magenta}";
          cyan = "#${colors.cyan}";
          white = "#${colors.gray}";
        };
        transparent_background_colors = true;
      };
      bell = {
        animation = "EaseOutExpo";
        duration = 80;
        color = "#${colors.orange}";
      };
      cursor = {
        style = {
          shape = "Beam";
          blinking = "On";
        };
        blink_interval = 500;
        blink_timeout = 0;
      };
    };
  };
}
