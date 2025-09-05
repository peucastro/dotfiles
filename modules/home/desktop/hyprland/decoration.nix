{
  wayland.windowManager.hyprland.settings.decoration = {
    rounding = 4;
    rounding_power = 6;

    blur = {
      enabled = true;
      size = 8;
      passes = 3;
      xray = true;
      noise = 0.01;
      brightness = 0.98;
      contrast = 1.1;
      popups = true;
      popups_ignorealpha = 0.5;
      input_methods = true;
      input_methods_ignorealpha = 0.5;
      special = true;
    };

    shadow = {
      enabled = true;
      range = 12;
      render_power = 4;
      offset = "0 5";
    };
  };
}
