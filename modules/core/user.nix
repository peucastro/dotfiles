{ user, pkgs, ... }: {
  users.users."${user.login}" = {
    isNormalUser = true;
    description = user.displayName;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  nix.settings.allowed-users = [ user.login ];
}
