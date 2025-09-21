{pkgs, ...}: {
  programs.nvf.settings.vim.languages = {
    enableFormat = true;
    enableTreesitter = true;
    enableExtraDiagnostics = true;

    assembly.enable = true;
    astro = {
      enable = true;
      format.package = pkgs.prettierd;
    };
    bash.enable = true;
    clang.enable = true;
    css = {
      enable = true;
      format.package = pkgs.prettierd;
    };
    dart.enable = true;
    go.enable = true;
    haskell.enable = true;
    html.enable = true;
    java.enable = true;
    kotlin.enable = true;
    lua.enable = true;
    markdown.enable = true;
    nix = {
      enable = true;
      lsp.package = pkgs.nixd;
    };
    php.enable = true;
    python.enable = true;
    rust.enable = true;
    scala.enable = true;
    sql.enable = true;
    svelte = {
      enable = true;
      format.package = pkgs.prettierd;
    };
    tailwind.enable = true;
    ts = {
      enable = true;
      format.package = pkgs.prettierd;
      extensions.ts-error-translator.enable = true;
    };
    yaml.enable = true;
  };
}
