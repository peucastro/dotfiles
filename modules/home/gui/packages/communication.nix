{pkgs, ...}: {
  home.packages = [
    pkgs.discord
    pkgs.slack
    pkgs.telegram-desktop
  ];
}
