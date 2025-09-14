{pkgs, ...}: {
  home.packages = [
    pkgs.act
    pkgs.alejandra
    pkgs.gemini-cli
    pkgs.jq
    pkgs.lazydocker
    pkgs.nixd
  ];
}
