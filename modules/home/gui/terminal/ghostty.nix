{
  programs.ghostty = {
    enable = true;
    settings = {
      font-family = "FiraCode Nerd Font Mono";
      font-size = 13.5;
      theme = "Gruvbox Dark Hard";
      cursor-style = "block";
      cursor-style-blink = true;
      background-opacity = 0.95;
      background-blur = true;
      link-url = true;
      window-theme = "ghostty";
      window-height = 35;
      window-width = 125;
      shell-integration = "zsh";
      shell-integration-features = "cursor,sudo,title";
      auto-update = "off";
    };
  };

  home.sessionVariables = {
    TERMINAL = "ghostty";
  };
}
