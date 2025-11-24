{
  config,
  pkgs,
  ...
}: {
  programs.vicinae = {
    enable = true;

    systemd = {
      enable = true;
      target = "graphical-session.target";
    };

    settings = {
      closeOnFocusLoss = false;
      faviconService = "google";
      font = {
        size = 12;
      };
      keybinding = "default";
      keybinds = {
      };
      popToRootOnClose = true;
      rootSearch = {
        searchFiles = true;
      };
      theme = {
        name = "gruvbox-dark";
      };
      window = {
        csd = true;
        opacity = 0.95;
        rounding = 10;
      };
    };

    extensions = [
      (config.lib.vicinae.mkExtension {
        name = "bluetooth";
        src =
          pkgs.fetchFromGitHub {
            owner = "vicinaehq";
            repo = "extensions";
            rev = "ec7334e9bb636f4771580238bd3569b58dbce879";
            sha256 = "043nyvd6z83rwm7slfnfwmfcqn3xk4i4vp7za2qlwb50kjxglrhb";
          }
          + "/extensions/bluetooth";
      })
      (config.lib.vicinae.mkExtension {
        name = "wifi-commander";
        src =
          pkgs.fetchFromGitHub {
            owner = "vicinaehq";
            repo = "extensions";
            rev = "926b4e122975f4a298fbc41fe79a0d1e4152b9b7";
            sha256 = "1mq1ixbk3p9f277vdh2rd8sqqd861af6vyprd6n3yhb77568n6ha";
          }
          + "/extensions/wifi-commander";
      })
      (config.lib.vicinae.mkExtension {
        name = "hypr-keybinds";
        src =
          pkgs.fetchFromGitHub {
            owner = "vicinaehq";
            repo = "extensions";
            rev = "4bd315e7a510a7743abce24037d4d4c2454e30ad";
            sha256 = "00ymbq27slb9hff995z84anhsz8a96qbz6q12magh2hjzi6a0rf4";
          }
          + "/extensions/hypr-keybinds";
      })
    ];
  };
}
