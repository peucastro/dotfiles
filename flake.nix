{
  description = "My personal NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, self, ... }@inputs:
    let
      system = "x86_64-linux";

      user = {
        login = "peu";
        displayName = "Pedro Castro";
      };

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [ ./hosts/laptop/configuration.nix ];

          specialArgs = {
            host = "laptop";
            inherit self inputs user;
          };
        };
      };
    };
}

