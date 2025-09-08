{
  description = "My personal NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    disko,
    home-manager,
    nvf,
    ...
  } @ inputs: let
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
        groups = ["networkmanager" "wheel"];
      };
    };

    mkSystem = extraSpecialArgs:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs =
          commonSystemArgs
          // {
            inherit self inputs;
            host = extraSpecialArgs.hostname;
          }
          // extraSpecialArgs;
        modules = [
          {nixpkgs.pkgs = pkgs;}
          disko.nixosModules.disko
          ./hosts/${extraSpecialArgs.hostname}/configuration.nix
        ];
      };
  in {
    formatter.${system} = pkgs.alejandra;
    nixosConfigurations = {
      yoga = mkSystem {
        hostname = "yoga";
      };
    };

    meta.hosts = builtins.attrNames self.nixosConfigurations;
  };
}
