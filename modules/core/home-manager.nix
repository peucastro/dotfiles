{
  inputs,
  user,
  pkgs-unstable,
  ...
}: let
  username = user.login;
  homeDir = user.homeDirectory or "/home/${username}";
in {
  imports = [inputs.home-manager.nixosModules.default];

  nixpkgs.config.allowUnfree = true;

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {inherit inputs user username pkgs-unstable;};
    backupFileExtension = "backup";

    users."${username}" = {
      imports = [
        inputs.nvf.homeManagerModules.default
        ./../home
      ];
      home.username = username;
      home.homeDirectory = homeDir;
      programs.home-manager.enable = true;
    };
  };
}
