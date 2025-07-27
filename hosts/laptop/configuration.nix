{ config, pkgs, host, user, ... }:

{
  imports = [ ./hardware-configuration.nix ../../modules/core ];

  services.power-profiles-daemon.enable = true;
  powerManagement.cpuFreqGovernor = "performance";

  networking.hostName = host;
  system.stateVersion = "25.05";
}
