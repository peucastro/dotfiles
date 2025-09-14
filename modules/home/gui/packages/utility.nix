{pkgs, ...}: {
  home.packages = [
    pkgs.gitkraken
    pkgs.hoppscotch
    pkgs.qbittorrent
    pkgs.mission-center
    pkgs.postman
    pkgs.snapper-gui
    pkgs.veracrypt
    pkgs.gparted
    pkgs.nautilus
  ];
}
