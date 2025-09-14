{pkgs, ...}: {
  home.packages = [
    pkgs.glances
    pkgs.s-tui
  ];
}
