{pkgs, ...}: {
  home.packages = [
    pkgs.cbonsai
    pkgs.cmatrix
    pkgs.pipes
    pkgs.tty-clock
  ];
}
