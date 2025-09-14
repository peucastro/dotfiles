{pkgs, ...}: {
  home.packages = [
    pkgs.cbonsai
    pkgs.cmatrix
    pkgs.pipes
    pkgs.tty-clock
    pkgs.figlet
    pkgs.cowsay
    pkgs.lolcat
    pkgs.fortune
  ];
}
