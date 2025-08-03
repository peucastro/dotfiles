{
  description = "My personal NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, disko, home-manager, ... }@inputs:
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

        mkSystem = { hostname, extraModules ? [], ... }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = commonSystemArgs // {
            inherit self inputs;
            host = hostname;
          };
          modules = [
            inputs.disko.nixosModules.disko
            ./hosts/${hostname}/configuration.nix
          ] ++ extraModules;
        };
      in
      {
        formatter = pkgs.alejandra;
        nixosConfigurations = {
          ideapad = mkSystem {
            hostname = "ideapad";
            extraModules = [ ./modules/core/snapper.nix ];
          };
        };
      };
}
