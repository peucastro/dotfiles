{pkgs, ...}: {
  environment.systemPackages = [pkgs.distrobox pkgs.distrobox-tui];
}
