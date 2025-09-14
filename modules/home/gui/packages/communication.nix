{pkgs, ...}: {
  home.packages = [
    pkgs.webcord-vencord
    pkgs.slack
    pkgs.telegram-desktop
  ];
}
