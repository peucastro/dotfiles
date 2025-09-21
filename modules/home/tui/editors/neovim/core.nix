{
  programs.nvf = {
    enable = true;
    settings.vim = {
      viAlias = false;
      vimAlias = true;
      lineNumberMode = "relNumber";
      withNodeJs = true;
      withPython3 = true;
      enableLuaLoader = true;
      searchCase = "smart";
      options = {
        tabstop = 4;
        shiftwidth = 2;
        wrap = false;
      };
    };
  };
}
