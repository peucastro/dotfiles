{
  programs.nvf.settings.vim.lsp = {
    enable = true;
    formatOnSave = true;
    lspkind.enable = true;
    trouble.enable = true;
    lspSignature.enable = true;
    inlayHints.enable = true;
    servers.nixd.cmd = ["nixd"];
  };
}
