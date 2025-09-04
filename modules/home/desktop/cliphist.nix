{pkgs, ...}: {
  services.cliphist = {
    enable = true;
    extraOptions = [
      "-max-dedupe-search"
      "50"
      "-max-items"
      "500"
    ];
  };

  home.packages = [pkgs.wl-clipboard];
}
