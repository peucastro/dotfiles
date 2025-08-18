{
  description = "My personal NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
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
            pkgs-unstable = import nixpkgs-unstable {inherit system;};
          }
          // extraSpecialArgs;
        modules = [
          ./hosts/${extraSpecialArgs.hostname}/configuration.nix
        ];
      };
  in {
    formatter.${system} = pkgs.alejandra;
    nixosConfigurations = {
      ideapad = mkSystem {
        hostname = "ideapad";
      };
    };

    meta.hosts = builtins.attrNames self.nixosConfigurations;
  };
}
