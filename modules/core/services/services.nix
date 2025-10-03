{pkgs, ...}: {
  services = {
    gnome.gnome-keyring.enable = true;
    power-profiles-daemon.enable = true;
  };

  programs.seahorse.enable = true;
  environment.systemPackages = [pkgs.libsecret];
}
