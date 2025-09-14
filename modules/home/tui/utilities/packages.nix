{pkgs, ...}: {
  home.packages = [
    pkgs.file
    pkgs.fzf
    pkgs.tree
    pkgs.duf
    pkgs.eza
    pkgs.fd
    pkgs.ncdu
    pkgs.ripgrep
    pkgs.tldr
  ];
}
