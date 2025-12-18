{pkgs, ...}: {
  services.cliphist = {
    enable = true;
    allowImages = false;
    extraOptions = [
      "-max-dedupe-search"
      "50"
      "-max-items"
      "500"
    ];
  };

  home.packages = [pkgs.wl-clipboard pkgs.wtype];
}
