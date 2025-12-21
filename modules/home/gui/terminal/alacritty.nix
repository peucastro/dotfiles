{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.95;
        padding = {
          x = 8;
          y = 8;
        };
        # decorations = "None";
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
      # colors = { ... }
      bell = {
        animation = "EaseOutExpo";
        duration = 80;
        color = "#ffb86c";
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
