let
  inherit (import ./colors.nix) colors;
in {
  programs.wlogout = {
    enable = true;
    layout = [
      {
        "label" = "lock";
        "action" = "loginctl lock-session";
        "text" = "Lock";
        "keybind" = "l";
      }
      {
        "label" = "hibernate";
        "action" = "systemctl hibernate";
        "text" = "Hibernate";
        "keybind" = "h";
      }
      {
        "label" = "logout";
        "action" = "loginctl terminate-user $USER";
        "text" = "Logout";
        "keybind" = "e";
      }
      {
        "label" = "shutdown";
        "action" = "systemctl poweroff";
        "text" = "Shutdown";
        "keybind" = "s";
      }
      {
        "label" = "suspend";
        "action" = "systemctl suspend";
        "text" = "Suspend";
        "keybind" = "u";
      }
      {
        "label" = "reboot";
        "action" = "systemctl reboot";
        "text" = "Reboot";
        "keybind" = "r";
      }
    ];
    style = ''
      * {
        font-family: Inter, sans-serif;
        font-size: 16px;
        background-image: none;
        box-shadow: none;
      }

      window {
        background-color: #${colors.background};
      }

      button {
        border-radius: 6px;
        border-color: #${colors.border};
        text-decoration-color: #${colors.foreground};
        color: #${colors.foreground};
        background-color: #${colors.background-alt};
        border-style: solid;
        border-width: 2px;
        background-repeat: no-repeat;
        background-position: center;
        background-size: 25%;
        margin: 8px;
        padding: 16px 32px;
        transition: background 0.2s, color 0.2s;
      }

      button:focus, button:active, button:hover {
        color: #${colors.background};
        background-color: #${colors.focused};
        border-color: #${colors.focused};
        outline-style: none;
      }
    '';
  };
}
