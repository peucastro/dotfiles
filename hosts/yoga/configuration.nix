{
  imports = [
    ./hardware-configuration.nix
    ./disk-configuration.nix
    ./state-configuration.nix
    ../../modules/core
  ];

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
  services.power-profiles-daemon.enable = true;
  powerManagement.cpuFreqGovernor = "performance";
}
