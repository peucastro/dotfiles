{ inputs, user, ... }:
let
  username = user.login;
  homeDir = user.homeDirectory or "/home/${username}";
in {
  imports = [ inputs.home-manager.nixosModules.default ];

  nixpkgs.config.allowUnfree = true;

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs user username; };
    backupFileExtension = "backup";

    users."${username}" = {
      imports = [ ./../home ];
      home.username = username;
      home.homeDirectory = homeDir;
      programs.home-manager.enable = true;
    };
  };
}
