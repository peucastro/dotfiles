{
  programs.nvf.settings.vim = {
    binds = {
      whichKey = {
        enable = true;
        register = {
          "<leader>b" = "Buffers";
          "<leader>c" = "Git conflicts";
          "<leader>f" = "Find";
          "<leader>g" = "Git";
          "<leader>l" = "LSP";
          "<leader>w" = "Windows";
        };
      };
      cheatsheet.enable = true;
    };
  };
}
