{pkgs, ...}: {
  home.packages = [
    pkgs.gemini-cli
    pkgs.lazydocker
  ];
}
