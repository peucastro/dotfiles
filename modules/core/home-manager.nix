{ inputs, user, ... }:
let username = user.login;
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
      home.homeDirectory = "/home/${username}";
      programs.home-manager.enable = true;
    };
  };
}
