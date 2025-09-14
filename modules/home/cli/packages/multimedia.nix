{pkgs, ...}: {
  home.packages = [
    pkgs.ani-cli
    pkgs.playerctl
  ];
}
