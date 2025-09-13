{
  pkgs,
  lib,
  user,
  initialPassword,
  ...
}: {
  programs.zsh.enable = true;

  users.groups.${user.login} = {};

  users.users.${user.login} = {
    isNormalUser = true;
    description = lib.mkDefault user.displayName;
    group = user.login;
    extraGroups = lib.mkDefault user.groups;
    initialPassword = lib.mkDefault initialPassword;
    shell = pkgs.zsh;
    home = "/home/${user.login}";
  };
}
