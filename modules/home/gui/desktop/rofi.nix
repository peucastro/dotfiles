{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    cycle = true;
    plugins = [pkgs.rofi-emoji];
    modes = ["drun" "emoji"];
    terminal = "${pkgs.ghostty}/bin/ghostty";

    theme = "gruvbox-dark-hard";
    font = "Inter 15";
  };
}
