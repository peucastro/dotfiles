{
  lib,
  config,
  ...
}:
lib.mkIf (config.custom.gpuChoice == "amd") {
  boot.initrd.kernelModules = ["amdgpu"];
  services.xserver.videoDrivers = ["amdgpu"];

  hardware.amdgpu.opencl.enable = true;
}
