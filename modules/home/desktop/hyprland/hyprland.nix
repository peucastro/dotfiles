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
    };
  };

  home.packages = with pkgs; [
    evince
    gnome-text-editor
    grim
    loupe
    nautilus
    slurp
    swappy
  ];

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    HYPRCURSOR_SIZE = 24;
  };
}
