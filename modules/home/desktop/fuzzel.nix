{pkgs, ...}: let
  colors = (import ./colors.nix).colors;
in {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "${pkgs.ghostty}/bin/ghostty";
        layer = "overlay";
        width = 30;
        font = "Inter:size=12";
        line-height = 20;
        fields = "name,generic,comment,categories,filename,keywords";
        icon-theme = "Adwaita";
      };
      colors = {
        background = "${colors.background}fa";
        text = "${colors.foreground}ff";
        match = "${colors.blue}ff";
        selection = "${colors.selection}40";
        selection-text = "${colors.foreground}ff";
        selection-match = "${colors.cyan}ff";
        border = "${colors.border}ff";
      };
      border = {
        width = 2;
        radius = 6;
      };
    };
  };
}
