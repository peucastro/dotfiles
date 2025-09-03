{pkgs, ...}: {
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    config = {
      terminal = "ghostty";
      menu = "fuzzel";
      input = {
        "*" = {
          xkb_layout = "pt";
        };
      };
    };
  };

  home.packages = with pkgs; [
    fuzzel
    swaylock
    swayidle
    wl-clipboard
    swaynotificationcenter
    waybar
    grim
    slurp
  ];
}
