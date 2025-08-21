{pkgs, ...}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        # Basic settings
        viAlias = false;
        vimAlias = true;
        lineNumberMode = "relNumber";
        withNodeJs = true;
        withPython3 = true;
        enableLuaLoader = true;
        options = {
          tabstop = 4;
          shiftwidth = 2;
          wrap = false;
        };

        # Theme
        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
        };

        # LSP
        lsp = {
          enable = true;
          formatOnSave = true;
          lspkind.enable = true;
          trouble.enable = true;
          lspSignature.enable = true;
        };

        # Languages
        languages = {
          enableFormat = true;
          enableTreesitter = true;
          enableExtraDiagnostics = true;

          nix.enable = true;
          html.enable = true;
          ts = {
            enable = true;
            lsp.enable = true;
            format.type = "prettierd";
            extensions.ts-error-translator.enable = true;
          };
          css = {
            enable = true;
            format.type = "prettierd";
          };
          python.enable = true;
          bash.enable = true;
          lua.enable = true;
          markdown.enable = true;
          yaml.enable = true;
          rust.enable = true;
          go.enable = true;
          java.enable = true;
          clang.enable = true;
        };

        # Autocomplete
        autocomplete = {
          nvim-cmp = {
            enable = true;
            sources = {
              nvim_lsp = "[LSP]";
              path = "[Path]";
              buffer = "[Buffer]";
              luasnip = "[LuaSnip]";
            };
          };
        };

        # Snippets
        snippets.luasnip.enable = true;

        # File tree
        filetree.neo-tree.enable = true;

        # Statusline
        statusline.lualine = {
          enable = true;
          theme = "gruvbox_dark";
        };

        # Tabline/Buffer line
        tabline.nvimBufferline.enable = true;

        # Telescope (fuzzy finder)
        telescope = {
          enable = true;
          extensions = [
            {
              name = "fzf";
              packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
              setup = {fzf = {fuzzy = true;};};
            }
          ];
        };

        # Git integration
        git = {
          enable = true;
          gitsigns.enable = true;
        };

        # Treesitter
        treesitter = {
          enable = true;
          fold = true;
          context.enable = true;
        };

        # Visual enhancements
        visuals = {
          nvim-web-devicons.enable = true;
          nvim-scrollbar.enable = true;
          nvim-cursorline.enable = true;
          cinnamon-nvim.enable = true;
          fidget-nvim.enable = true;
          highlight-undo.enable = true;
          rainbow-delimiters.enable = true;

          indent-blankline = {
            enable = true;
            setupOpts.scope.enabled = true;
          };
        };

        # Autopairs
        autopairs.nvim-autopairs.enable = true;

        # Key bindings
        binds = {
          whichKey.enable = true;
          cheatsheet.enable = true;
        };

        # Terminal
        terminal.toggleterm = {
          enable = true;
          lazygit.enable = true;
        };

        # Utility
        utility = {
          preview.markdownPreview.enable = true;
          ccc.enable = false;
          vim-wakatime.enable = false;
          icon-picker.enable = true;
          surround.enable = true;
          diffview-nvim.enable = true;
          motion = {
            hop.enable = true;
            leap.enable = true;
          };
        };

        # UI improvements
        ui = {
          borders.enable = true;
          noice.enable = true;
          colorizer.enable = true;
          illuminate.enable = true;
          breadcrumbs = {
            enable = true;
            navbuddy.enable = true;
          };
          smartcolumn.enable = true;
        };

        # Notifications
        notify.nvim-notify.enable = true;

        # Dashboard
        dashboard.dashboard-nvim.enable = true;
      };
    };
  };
}
