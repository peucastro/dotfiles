{ pkgs, ... }: {
  home.packages = with pkgs; [ evince file-roller gnome-text-editor ];

  dconf.settings = {
    "org/gnome/TextEditor" = {
      highlight-current-line = true;
      indent-style = "space";
      show-line-numbers = true;
      show-right-margin = false;
      style-scheme = "builder-dark";
      wrap-text = false;
    };
  };
}
