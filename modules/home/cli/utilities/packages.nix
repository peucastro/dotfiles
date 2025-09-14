{pkgs, ...}: {
  home.packages = [
    pkgs.file
    pkgs.tree
    pkgs.duf
    pkgs.eza
    pkgs.fd
    pkgs.ripgrep
    pkgs.tldr
  ];
}
