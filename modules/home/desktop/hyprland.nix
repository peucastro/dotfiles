{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    systemd.variables = ["--all"];
    settings = {
      "$modifier" = "SUPER";
      bind = [
        "$modifier,Return,exec,ghostty"
        "$modifier,Q,killactive"
        "$modifier,Left,movefocus,l"
        "$modifier,Right,movefocus,r"
        "$modifier,Up,movefocus,u"
        "$modifier,Down,movefocus,d"
        "$modifier,F,fullscreen"
        "$modifier,E,exec,thunar"
        "$modifier,D,exec,fuzzel"
        "$modifier,Tab,cyclenext"
        "$modifier,T,togglefloating"
        "$modifier,1,workspace,1"
        "$modifier,2,workspace,2"
        "$modifier,3,workspace,3"
        "$modifier,4,workspace,4"
        "$modifier,5,workspace,5"
        "$modifier,6,workspace,6"
        "$modifier,7,workspace,7"
        "$modifier,8,workspace,8"
        "$modifier,9,workspace,9"
        "$modifier Shift,1,movetoworkspace,1"
        "$modifier Shift,2,movetoworkspace,2"
        "$modifier Shift,3,movetoworkspace,3"
        "$modifier Shift,4,movetoworkspace,4"
        "$modifier Shift,5,movetoworkspace,5"
        "$modifier Shift,6,movetoworkspace,6"
        "$modifier Shift,7,movetoworkspace,7"
        "$modifier Shift,8,movetoworkspace,8"
        "$modifier Shift,9,movetoworkspace,9"
      ];
      input = {
        kb_layout = "pt";
        touchpad = {
          natural_scroll = true;
        };
      };
    };
  };
}
