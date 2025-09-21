{
  programs.nvf.settings.vim.visuals = {
    fidget-nvim = {
      enable = true;
      setupOpts = {
        notification = {
          override_vim_notify = true;
        };
      };
    };
    nvim-web-devicons.enable = true;
    nvim-scrollbar.enable = true;
    nvim-cursorline.enable = true;
    cinnamon-nvim.enable = true;
    highlight-undo.enable = true;
    rainbow-delimiters.enable = true;
    indent-blankline = {
      enable = true;
      setupOpts.scope.enabled = true;
    };
  };
}
