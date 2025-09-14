{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    systemd = {
      enable = true;
      variables = ["--all"];
    };
    xwayland.enable = true;
    settings = {
      "$modifier" = "SUPER";
      "$terminal" = "ghostty";
      "$fileManager" = "nautilus --new-window";
      "$menu" = "fuzzel";
      "$browser" = "zen";

      animations.enabled = false;
      decoration = {
        rounding = 4;
        rounding_power = 6;
        blur.enabled = false;
        shadow.enabled = false;
      };

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
        kb_layout = "pt,us";
        kb_options = "grp:alt_shift_toggle";
        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
        };
      };

      exec-once = [
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      ];
    };
  };

  home.packages = [pkgs. hyprpicker];

  services.hyprpolkitagent.enable = true;

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    HYPRCURSOR_SIZE = 24;
  };
}
