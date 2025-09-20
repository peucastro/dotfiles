{lib, ...}: {
  options.custom.gpuChoice = lib.mkOption {
    type = lib.types.enum ["amd" "nvidia"];
    description = "Choose GPU setup (amd or nvidia)";
    default = "amd";
    example = "nvidia";
  };

  config = {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  imports = [./amdgpu.nix ./nvidia.nix];
}
