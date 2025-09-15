{user, ...}: {
  virtualisation = {
    containers.enable = true;

    docker = {
      enable = true;
      enableOnBoot = false;
      autoPrune.enable = true;

      storageDriver = "btrfs";
    };
  };

  users.extraGroups.docker.members = [user.login];
}
