{
  programs.nvf.settings.vim.git = {
    enable = true;

    gitsigns = {
      enable = true;
      setupOpts = {
        numhl = true;
        linehl = false;
        current_line_blame = true;
      };
      mappings = {
        toggleBlame = "<leader>gb";
        toggleDeleted = "<leader>gd";
      };
    };

    neogit.enable = true;
    vim-fugitive.enable = true;
    git-conflict.enable = true;
  };
}
