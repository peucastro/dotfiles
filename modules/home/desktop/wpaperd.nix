{
  services.wpaperd = {
    enable = true;
    settings.default = {
      path = "~/dotfiles/assets/wallpapers";
      duration = "30m";
      sorting = "ascending";
      mode = "center";
      transition-time = 300;
    };
  };
}
