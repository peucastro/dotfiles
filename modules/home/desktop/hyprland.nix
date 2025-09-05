{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    systemd = {
      enable = true;
      enableXdgAutostart = true;
      variables = ["--all"];
    };
    xwayland = {
      enable = true;
    };
    settings = {
      "$modifier" = "SUPER";
      "$terminal" = "ghostty";
      "$fileManager" = "nautilus --new-window";
      "$menu" = "fuzzel";

      general = {
        gaps_in = 3;
        gaps_out = 5;

        border_size = 2;

        resize_on_border = true;
        extend_border_grab_area = 10;

        layout = "dwindle";

        snap.enabled = true;
      };

      decoration = {
        rounding = 3;
        rounding_power = 5;

        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 20;
          render_power = 4;
          offset = "0 5";
        };

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
      };

      animations.enabled = false;

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master.new_status = "master";

      misc = {
        disable_hyprland_logo = true;
        force_default_wallpaper = 0;
        font_family = "Inter";
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
      };

      input = {
        kb_layout = "pt";
        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
        };
      };
    };
    extraConfig = ''
      monitor=eDP-1,2880x1800@120,0x0,1.5
      monitor=HDMI-A-1,1920x1080@100,2880x0,1
    '';
  };

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    HYPRCURSOR_SIZE = 24;
  };
}
