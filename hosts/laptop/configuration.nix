{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  services = {
    power-profiles-daemon.enable = true;
  };

  powerManagement.cpuFreqGovernor = "performance";
  networking.hostName = "ideapad";
  system.stateVersion = "25.05";
}
