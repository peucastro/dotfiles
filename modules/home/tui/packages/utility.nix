{pkgs, ...}: {
  home.packages = [
    pkgs.fzf
    pkgs.ncdu
    pkgs.bitwise
  ];
}
