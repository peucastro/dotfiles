{
  lib,
  config,
  ...
}:
lib.mkIf (config.custom.gpuChoice == "nvidia")
{
  boot.initrd.kernelModules = ["nvidia"];
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia.modesetting.enable = true;
}
