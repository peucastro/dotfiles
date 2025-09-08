{user, ...}: let
  username = user.login;
in {
  imports = [
    ./hardware-configuration.nix
    ./disk-configuration.nix
    ./state-configuration.nix
    ../../modules/core
  ];

  home-manager.users."${username}".imports = [
    ../../modules/home
  ];

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
}
