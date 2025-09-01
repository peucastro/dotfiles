{
  imports = [
    ./hardware-configuration.nix
    ./state-configuration.nix
    ../../modules/core
  ];

  services.power-profiles-daemon.enable = true;
  powerManagement.cpuFreqGovernor = "performance";
}
