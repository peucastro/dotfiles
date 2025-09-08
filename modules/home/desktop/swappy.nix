let
  colors = (import ./colors.nix).colors;
in
  {pkgs, ...}: {
    programs.swappy = {
      enable = true;
      settings."Default" = {
        save_dir = "$HOME/Pictures/Screenshots";
        save_filename_format = "Screenshot-%Y%m%d-%H%M%S.png";
        show_panel = false;
        line_size = 5;
        text_size = 12;
        text_font = "Inter";
        paint_mode = "brush";
        early_exit = true;
        fill_shape = false;
        auto_save = false;
        custom_color = "#${colors.focused}";
        transparent = true;
        transparency = 85;
      };
    };

    home.packages = with pkgs; [
      grim
      slurp
    ];
  }
