let
  colors = (import ../colors.nix).colors;
in {
  wayland.windowManager.hyprland.settings.general = {
    gaps_in = 5;
    gaps_out = 10;

    "col.active_border" = "rgba(${colors.focused}ff) rgba(${colors.selection}ff) 45deg";
    "col.inactive_border" = "rgba(${colors.unfocused}ff) rgba(${colors.gray}ff) 0deg";
    border_size = 2;
    resize_on_border = true;
    extend_border_grab_area = 10;

    snap.enabled = true;
  };
}
