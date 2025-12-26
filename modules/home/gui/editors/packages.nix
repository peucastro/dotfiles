{pkgs, ...}: {
  home.packages = [
    pkgs.gnome-text-editor
    pkgs.android-studio
    pkgs.jetbrains.clion
    pkgs.jetbrains.idea
    pkgs.jetbrains.phpstorm
    pkgs.jetbrains.pycharm
    pkgs.jetbrains.datagrip
  ];
}
