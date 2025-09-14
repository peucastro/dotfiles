{pkgs, ...}: {
  home.packages = [
    pkgs.ani-cli
    pkgs.mpv
    pkgs.playerctl
  ];
}
