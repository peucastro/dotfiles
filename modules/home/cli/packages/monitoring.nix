{pkgs, ...}: {
  home.packages = [
    pkgs.fastfetch
    pkgs.nitch
    pkgs.onefetch
  ];
}
