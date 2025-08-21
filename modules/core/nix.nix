{inputs, ...}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "-d";
  };

  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
}
