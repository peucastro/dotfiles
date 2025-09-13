{
  agenix,
  secrets,
  ...
}: {
  imports = [agenix.nixosModules.default];

  age = {
    identityPaths = [
      "/etc/ssh/agenix_shared_key"
      "/etc/ssh/agenix_recovery_key"
    ];

    secrets = {
      id_ed25519 = {
        file = "${secrets}/id_ed25519.age";
        path = "/home/peu/.ssh/id_ed25519";
        symlink = true;
        mode = "0400";
        owner = "peu";
        group = "users";
      };
    };
  };
}
