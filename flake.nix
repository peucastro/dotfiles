{
  description = " My personal NixOS & Home Manager configurations.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    systems.url = "github:nix-systems/default";
    utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };

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
      inputs.systems.follows = "systems";
    };
  };

  outputs = {
    self,
    nixpkgs,
    utils,
    disko,
    home-manager,
    nvf,
    ...
  } @ inputs: let
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

    mkSystem = system: {
      hostname,
      user ? defaultSystemArgs.user,
      initialPassword ? defaultSystemArgs.initialPassword,
      extraModules ? [],
    }: let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
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
  in
    utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
      in {
        formatter = pkgs.alejandra;
        devShells = import ./shell.nix {inherit pkgs;};
      }
    )
    // {
      nixosConfigurations = {
        yoga = mkSystem "x86_64-linux" {
          hostname = "yoga";
          extraModules = [disko.nixosModules.disko];
        };
        ideapad = mkSystem "x86_64-linux" {
          hostname = "ideapad";
          extraModules = [disko.nixosModules.disko];
        };
      };
    };
}
