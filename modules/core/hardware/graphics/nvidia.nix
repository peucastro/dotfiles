{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf (config.custom.gpuChoice == "nvidia")
{
  boot.initrd.kernelModules = ["nvidia"];
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia.modesetting.enable = true;

  environment.systemPackages = [
    pkgs.nvidia_x11
    pkgs.vulkan-tools
    pkgs.nvidia-settings
    pkgs.glxinfo
  ];
}
