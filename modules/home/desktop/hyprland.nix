{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    systemd.variables = ["--all"];
    settings = {
      "$modifier" = "SUPER";
      input = {
        kb_layout = "pt";
        touchpad = {
          natural_scroll = true;
        };
      };
    };
  };
}
