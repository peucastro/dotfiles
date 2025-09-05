{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    systemd = {
      enable = true;
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
      "$browser" = "firefox";

      general = {
        gaps_in = 5;
        gaps_out = 10;

        border_size = 2;
        resize_on_border = true;
        extend_border_grab_area = 10;

        snap.enabled = true;
      };

      decoration = {
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

      animations.enabled = false;

      dwindle = {
        pseudotile = true;
        force_split = 2;
      };

      master = {
        new_status = "master";
        new_on_top = 1;
        mfact = 0.5;
      };

      input = {
        kb_layout = "pt";
        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
        };
      };

      cursor = {
        enable_hyprcursor = false;
        no_warps = true;
        warp_on_change_workspace = 2;
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        force_default_wallpaper = 0;
        font_family = "Inter";
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
        allow_session_lock_restore = true;
        focus_on_activate = true;
      };

      ecosystem = {
        no_update_news = true;
        no_donation_nag = true;
      };
    };
    extraConfig = ''
      monitor=eDP-1,2880x1800@120,0x0,1.5
      monitor=HDMI-A-1,1920x1080@100,2880x0,1
    '';
  };

  home.packages = with pkgs; [
    evince
    gnome-text-editor
    grim
    loupe
    nautilus
    slurp
  ];

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    HYPRCURSOR_SIZE = 24;
  };
}
