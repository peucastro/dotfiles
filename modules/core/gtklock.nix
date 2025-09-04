{pkgs, ...}: let
  colors = (import ../home/desktop/colors.nix).colors;
in {
  programs.gtklock = {
    enable = true;
    config.main = {
      gtk-theme = "Adwaita-dark";
      time-format = "%H:%M";
      date-format = "%A, %d %B %Y";
    };
    modules = with pkgs; [
      gtklock-powerbar-module
      gtklock-userinfo-module
    ];
    style = ''
      window {
        background-color: ${colors.background};
      }
      #time, #date {
        color: ${colors.foreground};
        font-family: Inter, sans-serif;
      }
      #input {
        background-color: ${colors.background-alt};
        color: ${colors.foreground};
        border-radius: 8px;
        border: 2px solid ${colors.focused};
      }
      #capslock-indicator {
        color: ${colors.blue};
      }
      #failed {
        color: ${colors.red};
      }
    '';
  };
}
