{pkgs, ...}: let
  inherit (import ./colors.nix) colors;
in {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "${pkgs.ghostty}/bin/ghostty";
        layer = "overlay";
        width = 50;
        font = "Inter:size=12";
        line-height = 20;
        fields = "name,filename,keywords";
        icon-theme = "Adwaita";
        match-mode = "fuzzy";
      };
      colors = {
        background = "#${colors.background-dim}fa";
        text = "#${colors.foreground}ff";
        match = "#${colors.blue}ff";
        selection = "#${colors.selection}40";
        selection-text = "#${colors.foreground}ff";
        selection-match = "#${colors.cyan}ff";
        border = "#${colors.border}ff";
      };
      border = {
        width = 2;
        radius = 6;
      };
    };
  };
}
