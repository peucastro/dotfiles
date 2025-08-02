{ lib, user, initialPassword, ... }: {
  users.users.${user.login} = {
    isNormalUser = true;
    description = lib.mkDefault user.displayName;
    extraGroups = lib.mkDefault user.groups;
    initialPassword = lib.mkDefault initialPassword;
    home = "/home/${user.login}";
  };
}
