let
  colors = (import ./colors.nix).colors;
in {
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 32;
      modules-left = ["sway/workspaces" "sway/window"];
      modules-center = ["clock"];
      modules-right = [
        "tray"
        "idle_inhibitor"
        "sway/language"
        "cpu"
        "memory"
        "temperature"
        "battery"
        "power-profiles-daemon"
        "network"
        "wireplumber"
        "bluetooth"
      ];

      "sway/workspaces" = {
        persistent-workspaces = {
          "1" = [];
          "2" = [];
          "3" = [];
          "4" = [];
          "5" = [];
        };
        sort-by-number = true;
        disable-scroll = true;
      };
      "sway/window" = {
        max-length = 50;
        rewrite = {
          "(.*) - Mozilla Firefox" = " $1";
          "(.*) - Chromium" = " $1";
        };
        icon = true;
      };

      "clock" = {
        format = "{:%H:%M - %a, %d %b %Y}";
        tooltip-format = "{:%Y-%m-%d | %H:%M:%S}";
        calendar = {
          mode = "month";
          mode-mon-col = 3;
          weeks-pos = "right";
          on-scroll = 1;
          format = {
            months = "<span color='${colors.yellow}'><b>{}</b></span>";
            days = "<span color='${colors.foreground-alt}'><b>{}</b></span>";
            weeks = "<span color='${colors.green}'><b>W{}</b></span>";
            weekdays = "<span color='${colors.blue}'><b>{}</b></span>";
            today = "<span color='${colors.red}'><b><u>{}</u></b></span>";
          };
        };
        actions = {
          on-click-right = "mode";
          on-scroll-up = "shift_up";
          on-scroll-down = "shift_down";
        };
      };

      "tray" = {
        spacing = 10;
      };
      "idle_inhibitor" = {
        format = "{icon}";
        format-icons = {
          activated = "";
          deactivated = "";
        };
      };
      "sway/language" = {
        format = "{shortDescription}";
        tooltip = false;
      };
      "cpu" = {
        interval = 2;
        format = " {usage}%";
        states = {
          warning = 55;
          critical = 80;
        };
        tooltip = true;
      };
      "memory" = {
        interval = 5;
        format = " {used:0.1f}G/{total:0.1f}G";
        states = {
          warning = 65;
          critical = 85;
        };
      };
      "temperature" = {
        interval = 10;
        format = " {icon} {temperatureC}°C";
        states = {
          warning = 60;
          critical = 75;
        };
        format-icons = ["" "" "" "" ""];
      };
      "battery" = {
        format = "{icon} {capacity}%";
        format-icons = ["" "" "" "" ""];
        interval = 5;
        states = {
          warning = 35;
          critical = 15;
        };
      };
      "power-profiles-daemon" = {
        format = "{icon}";
        format-icons = {
          performance = "";
          balanced = "";
          power-saver = "";
        };
      };
      "network" = {
        format = "{ifname}";
        format-wifi = " {bandwidthDownBytes}";
        format-ethernet = " {bandwidthDownBytes}";
        format-disconnected = "";
        format-disabled = "";
      };
      "wireplumber" = {
        format = "{icon} {volume}%";
        format-muted = "";
        format-source = "󰍬 {volume}%";
        format-source-muted = "󰍭";
        format-icons = {
          default = ["" "" ""];
        };
        on-scroll-up = "";
        on-scroll-down = "";
        on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        on-click-right = "pavucontrol";
        tooltip = true;
        tooltip-format = "{node_name}";
      };
      "bluetooth" = {
        format = " {status}";
        format-disabled = "";
        format-off = "";
        format-on = "";
        format-connected = " {num_connections}";
        format-no-controller = "";
        tooltip = true;
        tooltip-format = "{controller_alias}\t{controller_address}";
        tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
        tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
        on-click = "blueman-manager";
      };
    };
    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: Inter, "Font Awesome 6 Free";
        font-size: 12px;
        min-height: 0;
      }

      window#waybar {
        background: ${colors.background};
        color: ${colors.foreground};
      }

      #workspaces button {
        padding: 0 5px;
        background: transparent;
        color: ${colors.foreground-alt};
        border-bottom: 2px solid transparent;
      }

      #workspaces button:hover {
        background: ${colors.background-alt};
        border-bottom-color: ${colors.focused};
      }

      #workspaces button.focused {
        background: ${colors.focused};
        color: ${colors.background};
        border-bottom-color: ${colors.focused};
      }

      #workspaces button.urgent {
        background: ${colors.urgent};
        color: ${colors.background};
        border-bottom-color: ${colors.urgent};
      }

      #clock, #cpu, #memory, #temperature, #battery, #power-profiles-daemon, #network, #wireplumber, #bluetooth, #tray, #idle_inhibitor, #language {
        padding: 0 8px;
        margin: 0 2px;
        background: transparent;
        color: ${colors.foreground-alt};
      }

      #clock:hover, #cpu:hover, #memory:hover, #temperature:hover, #battery:hover, #power-profiles-daemon:hover, #network:hover, #wireplumber:hover, #bluetooth:hover, #tray:hover, #idle_inhibitor:hover, #language:hover {
        background: ${colors.background-alt};
        color: ${colors.foreground};
      }

      #cpu.warning, #memory.warning, #temperature.warning, #battery.warning {
        color: ${colors.yellow};
      }

      #cpu.critical, #memory.critical, #temperature.critical, #battery.critical {
        color: ${colors.red};
      }

      #battery.charging {
        color: ${colors.green};
      }
    '';
  };
}
