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
      control-center-layer = "overlay";
      control-center-exclusive-zone = true;
      control-center-margin-top = 10;
      control-center-margin-bottom = 10;
      control-center-margin-right = 10;
      control-center-margin-left = 10;
      control-center-width = 400;
      control-center-height = 600;
      notification-window-width = 400;
      notification-window-height = 200;
      notification-2fa-action = true;
      notification-grouping = true;
      image-visibility = "always";
      timeout = 8;
      timeout-low = 5;
      timeout-critical = 0;
      keyboard-shortcuts = true;
      transition-time = 200;
      hide-on-clear = true;
      hide-on-action = true;
      fit-to-screen = true;
      relative-timestamps = true;
      text-empty = "No Notifications";
      widgets = ["title" "dnd" "notifications" "volume" "backlight" "inhibitors"];
      widget-config = {
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "Clear All";
        };
        dnd = {text = "Do Not Disturb";};
        notifications = {vexpand = true;};
        volume = {};
        backlight = {};
        inhibitors = {};
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
