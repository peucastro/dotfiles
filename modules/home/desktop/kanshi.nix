{lib, ...}: {
  services.kanshi = {
    enable = true;
    settings = [
      {
        output = {
          criteria = "eDP-1";
          mode = "2880x1800@120Hz";
          position = "0,0";
          scale = 1.5;
        };
      }
      {
        output = {
          criteria = "HDMI-A-1";
          mode = "1920x1080@100Hz";
          position = "2880,0";
          scale = 1.0;
        };
      }
      {
        profile = {
          name = "undocked";
          outputs = [
            {
              criteria = "eDP-1";
            }
          ];
        };
      }
      {
        profile = {
          name = "docked";
          outputs = [
            {
              criteria = "eDP-1";
            }
            {
              criteria = "HDMI-A-1";
            }
          ];
        };
      }
    ];
  };

  systemd.user.services.kanshi = {
    Unit = {
      After = lib.mkForce ["sway-session.target"];
      Requires = lib.mkForce ["sway-session.target"];
    };
  };
}
