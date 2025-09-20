{
  imports = [
    ./hardware-configuration.nix
    ./disk-configuration.nix
    ./state-configuration.nix
    ./home-configuration.nix
    ../../modules/core
  ];

  custom.gpuChoice = "amd";
}
