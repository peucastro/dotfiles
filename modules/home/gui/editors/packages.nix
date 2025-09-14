{pkgs, ...}: {
  home.packages = [
    pkgs.gnome-text-editor
    pkgs.android-studio
    pkgs.jetbrains.clion
    pkgs.jetbrains.idea-ultimate
    pkgs.jetbrains.phpstorm
    pkgs.jetbrains.pycharm-professional
  ];
}
