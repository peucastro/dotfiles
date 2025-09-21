{
  programs.nvf.settings.vim = {
    binds = {
      whichKey = {
        enable = true;
        register = {
          "<leader>b" = "Buffers";
          "<leader>c" = "Git conflicts";
          "<leader>f" = "Find/Files";
          "<leader>g" = "Git";
          "<leader>l" = "LSP";
          "<leader>w" = "Windows";
        };
      };
      cheatsheet.enable = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>wv";
        action = ":vsplit<CR>";
      }
      {
        mode = "n";
        key = "<leader>ws";
        action = ":split<CR>";
      }
      {
        mode = "n";
        key = "<leader>wq";
        action = ":q<CR>";
      }
      {
        mode = "n";
        key = "<leader>wh";
        action = "<C-w>h";
      }
      {
        mode = "n";
        key = "<leader>wj";
        action = "<C-w>j";
      }
      {
        mode = "n";
        key = "<leader>wk";
        action = "<C-w>k";
      }
      {
        mode = "n";
        key = "<leader>wl";
        action = "<C-w>l";
      }
    ];
  };
}
