{pkgs, ...}: {
  qt = {
    enable = true;
    platformTheme = "gtk";
    style = {
      name = "kvantum";
      package = pkgs.libsForQt5.qtstyleplugin-kvantum;
    };
  };

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "gtk2";
    QT_STYLE_OVERRIDE = "kvantum";
  };
}
