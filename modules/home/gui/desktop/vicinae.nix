{
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
  };

  xdg.configFile."vicinae/vicinae.json".force = true;
}
