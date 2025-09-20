{
  user,
  pkgs,
  ...
}: {
  environment.systemPackages = [
    pkgs.protonup-qt
    pkgs.mangohud
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/${user.login}/.steam/root/compatibilitytools.d";
  };
}
