{ inputs, user, ... }:
let username = user.login;
in {
  imports = [ inputs.home-manager.nixosModules.default ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs user username; };
    backupFileExtension = "backup";

    users."${username}" = {
      imports = [ ./../home ];
      home.username = username;
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "25.05";
      programs.home-manager.enable = true;
    };
  };
}
