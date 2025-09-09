{inputs, ...}: {
  nix = {
    settings.experimental-features = ["nix-command" "flakes"];

    gc = {
      automatic = true;
      dates = "monthly";
      options = "-d";
    };

    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  };
}
