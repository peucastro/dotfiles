{pkgs, ...}: {
  home.packages = [
    pkgs.act
    pkgs.alejandra
    pkgs.jq
    pkgs.yq
    pkgs.nixd
  ];
}
