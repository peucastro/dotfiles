{ user, ... }:
let
  stateVersion = "25.05";
in
{
  system.stateVersion = stateVersion;
  home-manager.users.${user.login}.home.stateVersion = stateVersion;
}
