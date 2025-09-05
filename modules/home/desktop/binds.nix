{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$modifier, Return, exec, $terminal"
      "$modifier, E, exec, $fileManager"
      "$modifier, D, exec, $menu"

      "$modifier, Q, killactive,"
      "$modifier SHIFT, C, exit,"

      "$modifier, V, togglefloating,"
      "$modifier, P, pseudo,"
      "$modifier SHIFT, I, togglesplit,"

      "$modifier, left, movefocus, l"
      "$modifier, right, movefocus, r"
      "$modifier, up, movefocus, u"
      "$modifier, down, movefocus, d"
      "$modifier, h, movefocus, l"
      "$modifier, l, movefocus, r"
      "$modifier, k, movefocus, u"
      "$modifier, j, movefocus, d"

      "$modifier SHIFT, left, movewindow, l"
      "$modifier SHIFT, right, movewindow, r"
      "$modifier SHIFT, up, movewindow, u"
      "$modifier SHIFT, down, movewindow, d"
      "$modifier SHIFT, h, movewindow, l"
      "$modifier SHIFT, l, movewindow, r"
      "$modifier SHIFT, k, movewindow, u"
      "$modifier SHIFT, j, movewindow, d"

      "$modifier, 1, workspace, 1"
      "$modifier, 2, workspace, 2"
      "$modifier, 3, workspace, 3"
      "$modifier, 4, workspace, 4"
      "$modifier, 5, workspace, 5"
      "$modifier, 6, workspace, 6"
      "$modifier, 7, workspace, 7"
      "$modifier, 8, workspace, 8"
      "$modifier, 9, workspace, 9"
      "$modifier, 0, workspace, 10"

      "$modifier SHIFT, 1, movetoworkspace, 1"
      "$modifier SHIFT, 2, movetoworkspace, 2"
      "$modifier SHIFT, 3, movetoworkspace, 3"
      "$modifier SHIFT, 4, movetoworkspace, 4"
      "$modifier SHIFT, 5, movetoworkspace, 5"
      "$modifier SHIFT, 6, movetoworkspace, 6"
      "$modifier SHIFT, 7, movetoworkspace, 7"
      "$modifier SHIFT, 8, movetoworkspace, 8"
      "$modifier SHIFT, 9, movetoworkspace, 9"
      "$modifier SHIFT, 0, movetoworkspace, 10"

      "$modifier, S, togglespecialworkspace"
      "$modifier SHIFT, S, movetoworkspace, special"

      "$modifier, F,fullscreen, 1"
      "$modifier SHIFT, F,fullscreen, 0"

      "$modifier CONTROL, right, workspace, e+1"
      "$modifier CONTROL, left, workspace, e-1"
    ];

    bindm = [
      "$modifier, mouse:272, movewindow"
      "$modifier, mouse:273, resizewindow"
    ];

    bindel = [
      ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      ",XF86MonBrightnessUp, exec, brightnessctl set +5%"
    ];

    bindl = [
      ",XF86AudioNext, exec, playerctl next"
      ",XF86AudioPause, exec, playerctl play-pause"
      ",XF86AudioPlay, exec, playerctl play-pause"
      ",XF86AudioPrev, exec, playerctl previous"
    ];
  };
}
