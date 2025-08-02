{ config, pkgs, host, user, ... }:

{
    imports = [
    ./hardware-configuration.nix
    ./disk-configuration.nix
    ./state-configuration.nix
    ../../modules/core
  ];

  services.power-profiles-daemon.enable = true;
  powerManagement.cpuFreqGovernor = "performance";

  networking.hostName = host;
}
