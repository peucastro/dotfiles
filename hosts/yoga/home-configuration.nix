{user, ...}: let
  username = user.login;
in {
  imports = [../../modules/core/home-manager.nix];

  home-manager.users."${username}".imports = [
    ../../modules/home
  ];

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
}
