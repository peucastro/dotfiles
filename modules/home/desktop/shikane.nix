{
  services.shikane = {
    enable = true;
    settings = {
      profile = [
        {
          name = "docked";
          output = [
            {
              match = "eDP-1";
              enable = true;
              alias = "laptop monitor";
              mode = "2880x1800@120Hz";
              scale = 1.2;
              position = {
                x = 0;
                y = 0;
              };
            }
            {
              match = "HDMI-A-1";
              enable = true;
              alias = "home monitor";
              mode = "1920x1080@100Hz";
              scale = 1.0;
              position = {
                x = 1440;
                y = 0;
              };
            }
          ];
        }
        {
          name = "undocked";
          output = [
            {
              match = "eDP-1";
              enable = true;
              alias = "laptop monitor";
              mode = "2880x1800@120Hz";
              scale = 1.2;
              position = {
                x = 0;
                y = 0;
              };
            }
          ];
        }
      ];
    };
  };
}
