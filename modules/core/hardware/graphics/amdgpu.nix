{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf (config.custom.gpuChoice == "amd") {
  boot.initrd.kernelModules = ["amdgpu"];
  services.xserver.videoDrivers = ["amdgpu"];

  hardware.amdgpu.opencl.enable = true;

  environment.systemPackages = [
    pkgs.mesa
    pkgs.vulkan-tools
    pkgs.libva
    pkgs.clinfo
    pkgs.radeontop
  ];
}
