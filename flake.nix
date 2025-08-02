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
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      commonSystemArgs = {
        initialPassword = "nixos";

        user = {
          login = "peu";
          displayName = "Pedro Castro";
          email = "falecompedroac@gmail.com";
          groups = [ "networkmanager" "wheel" ];
        };
      };

      mkSystem = extraSpecialArgs: nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = commonSystemArgs // {
          inherit self inputs;
          host = extraSpecialArgs.hostname;
        } // extraSpecialArgs;
        modules = [
          ./hosts/${extraSpecialArgs.hostname}/configuration.nix
        ];
      };

    in {
      nixosConfigurations = {
        laptop = mkSystem {
          hostname = "laptop";
        };
      };

      meta.hosts = builtins.attrNames self.nixosConfigurations;
    };
}
