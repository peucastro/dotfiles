let
  colors = (import ./colors.nix).colors;
in {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
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
        format = "  {usage}%";
        states = {
          warning = 55;
          critical = 80;
        };
        tooltip = true;
      };
      "memory" = {
        interval = 5;
        format = "  {used:0.1f}G / {total:0.1f}G";
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
        format-wifi = "  {bandwidthDownBytes}";
        format-ethernet = "  {bandwidthDownBytes}";
        format-disconnected = "";
        format-disabled = "";
      };
      "wireplumber" = {
        format = "{icon}  {volume}%";
        format-muted = "";
        format-source = "󰍬  {volume}%";
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
    };
    style = ''
      * {
        border: none;
        min-height: 0;
        font-family: Inter, "Font Awesome 6 Free";
        font-weight: 500;
        font-size: 14px;
        padding: 0;
        margin: 0;
      }

      window#waybar {
        background: ${colors.background-alt};
        border: 2px solid ${colors.background-dim};
      }

      tooltip {
        background-color: ${colors.background-dim};
        border: 2px solid ${colors.unfocused};
        color: ${colors.foreground-alt};
      }

      #window,
      #clock,
      #tray,
      #cpu,
      #memory,
      #temperature,
      #battery,
      #power-profiles-daemon,
      #network,
      #wireplumber,
      #idle_inhibitor,
      #language {
        margin: 6px 6px 6px 0px;
        padding: 2px 8px;
      }

      #workspaces,
      #window {
        background-color: ${colors.background-dim};
        margin: 6px 0px 6px 6px;
        border: 2px solid ${colors.unfocused};
      }

      #workspaces button {
        all: initial;
        box-shadow: inset 0 -3px transparent;
        padding: 4px;
        color: ${colors.focused};
        background: transparent;
        border: none;
      }

      #workspaces button.focused {
        background-color: ${colors.selection};
        color: ${colors.background-alt};
        border: 2px solid ${colors.focused};
      }

      #workspaces button.urgent {
        background-color: ${colors.orange};
        color: ${colors.background-alt};
        border: 2px solid ${colors.urgent};
      }

      window#waybar.empty #window {
        background-color: transparent;
        border-style: none;
      }

      #clock {
        background-color: ${colors.background-dim};
        border: 2px solid ${colors.unfocused};
      }

      #tray {
        background-color: ${colors.foreground-dim};
        border: 2px solid ${colors.focused};
        color: ${colors.background-alt};
      }

      #battery {
        background-color: ${colors.green};
        border: 2px solid ${colors.focused};
        color: ${colors.background-alt};
      }

      #cpu,
      #memory,
      #temperature,
      #power-profiles-daemon,
      #network,
      #wireplumber,
      #idle_inhibitor,
      #language {
        background-color: ${colors.selection};
        border: 2px solid ${colors.focused};
        color: ${colors.background-alt};
      }

      #cpu.warning,
      #memory.warning,
      #temperature.warning,
      #battery.warning {
        background-color: ${colors.selection};
        border: 2px solid ${colors.yellow};
      }

      #cpu.critical,
      #memory.critical,
      #temperature.critical,
      #battery.critical {
        background-color: ${colors.selection};
        border: 2px solid ${colors.red};
      }

      #battery.charging {
        background-color: ${colors.green};
        border: 2px solid ${colors.focused};
      }

      #wireplumber.muted {
        background-color: ${colors.gray};
        border: 2px solid ${colors.unfocused};
      }
    '';
  };
}
