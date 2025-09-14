{pkgs, ...}: {
  home.packages = [
    pkgs.firefox
    pkgs.ungoogled-chromium
  ];
}
