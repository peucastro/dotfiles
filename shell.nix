{pkgs ? import <nixpkgs> {}, ...}: {
  default = pkgs.mkShell {
    NIX_CONFIG = "extra-experimental-features = nix-command flakes";
    buildInputs = with pkgs; [
      nix
      home-manager
      direnv
      git
      curl
      wget
    ];
  };
}
