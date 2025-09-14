{pkgs, ...}: {
  home.packages = [
    pkgs.figlet
    pkgs.cowsay
    pkgs.lolcat
    pkgs.fortune
  ];
}
