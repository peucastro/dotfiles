{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        hide_cursor = true;
        disable_loading_bar = true;
      };

      background = {
        monitor = "";
        path = "screenshot";
        blur_passes = 3;
      };

      input-field = {
        monitor = "";
        size = "20%, 5%";
        outline_thickness = 2;
        rounding = 10;
        position = "0, -100";
        halign = "center";
        valign = "center";
        placeholder_text = "Input password...";
        fail_text = "$PAMFAIL";
        dots_spacing = 0.3;
        fade_on_empty = false;
      };
      label = [
        {
          monitor = "";
          text = "$TIME";
          font_size = 90;
          position = "0, -250";
          halign = "center";
          valign = "top";
        }
        {
          monitor = "";
          text = "cmd[update:60000] date +\"%A, %d %B %Y\"";
          font_size = 25;
          position = "0, -400";
          halign = "center";
          valign = "top";
        }
        {
          monitor = "";
          text = "$LAYOUT[pt, en]";
          font_size = 24;
          onclick = "hyprctl switchxkblayout all next";

          position = "250, -100";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
