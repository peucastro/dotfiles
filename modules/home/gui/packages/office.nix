{pkgs, ...}: {
  home.packages = [
    pkgs.calibre
    pkgs.evince
    pkgs.libreoffice
    pkgs.obsidian
    pkgs.planify
    pkgs.qalculate-gtk
  ];
}
