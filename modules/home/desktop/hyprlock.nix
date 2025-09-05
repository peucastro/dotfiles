let
  colors = (import ./colors.nix).colors;
in {
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
        color = "rgb(${colors.background-alt})";
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
        outer_color = "rgba(${colors.border}ff) rgba(${colors.focused}ff) 45deg";
        inner_color = "rgb(${colors.background-dim})";
        font_color = "rgb(${colors.foreground})";
        fail_color = "rgba(${colors.red}ff) rgba(${colors.orange}ff) 45deg";
        check_color = "rgba(${colors.green}ff) rgba(${colors.blue}ff) 45deg";
      };
      label = [
        {
          monitor = "";
          text = "$TIME";
          font_size = 90;
          position = "0, -250";
          halign = "center";
          valign = "top";
          color = "rgb(${colors.foreground})";
        }
        {
          monitor = "";
          text = "cmd[update:60000] date +\"%A, %d %B %Y\"";
          font_size = 25;
          position = "0, -400";
          halign = "center";
          valign = "top";
          color = "rgb(${colors.foreground-alt})";
        }
        {
          monitor = "";
          text = "$LAYOUT[pt, en]";
          font_size = 24;
          onclick = "hyprctl switchxkblayout all next";
          position = "250, -100";
          halign = "center";
          valign = "center";
          color = "rgb(${colors.foreground-alt})";
        }
      ];
    };
  };
}
