{
  imports = [
    ./hardware-configuration.nix
    ./disk-configuration.nix
    ./state-configuration.nix
    ./home-configuration.nix
    ../../secrets
    ../../modules/core
  ];
}
