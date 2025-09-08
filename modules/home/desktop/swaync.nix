let
  colors = (import ./colors.nix).colors;
in {
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
      layer = "overlay";
      layer-shell = true;
      control-center-layer = "top";
      control-center-exclusive-zone = true;
      control-center-margin-top = 13;
      control-center-margin-bottom = 0;
      control-center-margin-right = 14;
      control-center-margin-left = 0;
      control-center-width = 400;
      control-center-height = 720;
      notification-window-width = 300;
      notification-window-height = 200;
      notification-2fa-action = true;
      notification-inline-replies = false;
      notification-icon-size = 24;
      notification-body-image-height = 100;
      notification-body-image-width = 100;
      notification-grouping = true;
      image-visibility = "when-available";
      timeout = 6;
      timeout-low = 3;
      timeout-critical = 0;
      keyboard-shortcuts = true;
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      fit-to-screen = false;
      relative-timestamps = true;
      text-empty = "No Notifications";
      script-fail-notify = true;
      cssPriority = "user";
      widgets = ["dnd" "buttons-grid" "mpris" "volume" "backlight" "title" "notifications"];
      widget-config = {
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "Clear";
        };
        dnd = {text = "Do Not Disturb";};
        notifications = {vexpand = true;};
        volume = {label = "󰕾";};
        backlight = {label = "󰃟";};
        mpris = {
          image-size = 50;
          image-radius = 0;
        };
        buttons-grid = {
          actions = [
            {
              label = "";
              command = "hyprlock";
            }
            {
              label = "󰝟";
              command = "swayosd-client --output-volume mute-toggle";
            }
            {
              label = "󰂯";
              command = "blueman-manager";
            }
            {
              label = "";
              command = "wlogout";
            }
          ];
        };
      };
    };
    style = ''
      .control-center {
        background: #${colors.background-alt};
        color: #${colors.foreground};
        border-radius: 10px;
        border: 2px solid #${colors.border};
        box-shadow: 0 2px 8px #${colors.background-dim}88;
      }
      .notification {
        background: #${colors.background-dim};
        color: #${colors.foreground};
        border-radius: 8px;
        border: 2px solid #${colors.border};
        margin: 6px 0;
      }
      .notification.critical {
        border-color: #${colors.red};
      }
      .notification.low {
        border-color: #${colors.gray};
      }
      .notification .title {
        color: #${colors.blue};
        font-weight: bold;
      }
      .notification .body {
        color: #${colors.foreground-alt};
      }
      .clear-all {
        background: #${colors.selection};
        color: #${colors.background};
        border-radius: 6px;
        border: none;
        padding: 6px 12px;
        font-weight: bold;
      }
      .dnd {
        color: #${colors.orange};
      }
      .volume, .backlight, .inhibitors {
        color: #${colors.cyan};
      }
    '';
  };
}
