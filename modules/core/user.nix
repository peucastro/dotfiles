{ pkgs, lib, user, initialPassword, ... }: {
  programs.zsh.enable = true;
  
  users.users.${user.login} = {
    isNormalUser = true;
    description = lib.mkDefault user.displayName;
    extraGroups = lib.mkDefault user.groups;
    initialPassword = lib.mkDefault initialPassword;
    shell = pkgs.zsh;
    home = "/home/${user.login}";
  };
}
