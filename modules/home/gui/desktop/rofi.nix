{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    plugins = [];
    terminal = "${pkgs.ghostty}/bin/ghostty";

    theme = "gruvbox-dark-hard";
    font = "Inter";
  };
}
