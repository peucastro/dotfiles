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
      inputs.home-manager.follows = "home-manager";
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

    defaultUser = {
      login = "peu";
      displayName = "Pedro Castro";
      email = "falecompedroac@gmail.com";
      groups = ["networkmanager" "wheel"];
    };

    defaultSystemArgs = {
      user = defaultUser;
      initialPassword = "nixos";
    };

    mkSystem = {
      hostname,
      user ? defaultSystemArgs.user,
      initialPassword ? defaultSystemArgs.initialPassword,
      extraModules ? [],
    }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit self inputs user initialPassword;
          host = hostname;
        };
        modules =
          [
            {nixpkgs.pkgs = pkgs;}
            ./hosts/${hostname}
          ]
          ++ extraModules;
      };
  in {
    formatter.${system} = pkgs.alejandra;
    nixosConfigurations = {
      yoga = mkSystem {
        hostname = "yoga";
        extraModules = [disko.nixosModules.disko];
      };
      ideapad = mkSystem {
        hostname = "ideapad";
        extraModules = [disko.nixosModules.disko];
      };
    };
  };
}
