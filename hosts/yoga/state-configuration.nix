{user, ...}: let
  stateVersion = "25.11";
in {
  system.stateVersion = stateVersion;
  home-manager.users.${user.login}.home.stateVersion = stateVersion;
}
