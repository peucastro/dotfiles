{
  programs.nvf.settings.vim.languages = {
    enableFormat = true;
    enableTreesitter = true;
    enableExtraDiagnostics = true;

    assembly.enable = true;
    astro = {
      enable = true;
      format.type = ["prettier"];
    };
    bash.enable = true;
    clang.enable = true;
    css = {
      enable = true;
      format.type = ["prettier"];
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
      lsp.servers = ["nixd"];
    };
    php.enable = true;
    python.enable = true;
    rust.enable = true;
    scala.enable = true;
    sql.enable = true;
    svelte = {
      enable = true;
      format.type = ["prettier"];
    };
    tailwind.enable = true;
    ts = {
      enable = true;
      format.type = ["prettier"];
      extensions.ts-error-translator.enable = true;
    };
    yaml.enable = true;
  };
}
