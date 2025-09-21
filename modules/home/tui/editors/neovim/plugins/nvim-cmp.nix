{
  programs.nvf.settings.vim.autocomplete.nvim-cmp = {
    enable = true;
    sources = {
      nvim_lsp = "[LSP]";
      path = "[Path]";
      buffer = "[Buffer]";
      luasnip = "[LuaSnip]";
      nvim_lua = "[Lua]";
      treesitter = "[Treesitter]";
      calc = "[Calc]";
      emoji = "[Emoji]";
    };
  };
}
