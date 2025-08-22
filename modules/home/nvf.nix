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
        searchCase = "smart";
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
          inlayHints.enable = true;
        };

        # Languages
        languages = {
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

        # Autocomplete
        autocomplete = {
          nvim-cmp = {
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

        # Keybindings
        binds = {
          whichKey = {
            enable = true;
            register = {
              "<leader>b" = "Buffers";
              "<leader>c" = "Git conflicts";
              "<leader>f" = "Find/Files";
              "<leader>g" = "Git";
              "<leader>l" = "LSP";
              "<leader>t" = "Terminal";
              "<leader>w" = "Windows";
            };
          };
          cheatsheet.enable = true;
        };

        keymaps = [
          # Window navigation
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

          # Terminal actions
          {
            mode = "n";
            key = "<C-t>";
            action = ":ToggleTerm<CR>";
          }
          {
            mode = "n";
            key = "<leader>lg";
            action = ":ToggleTerm lazygit<CR>";
          }
          {
            mode = "n";
            key = "<leader>tt";
            action = ":ToggleTerm direction=tab<CR>";
          }
          {
            mode = "n";
            key = "<leader>tf";
            action = ":ToggleTerm direction=float<CR>";
          }
          {
            mode = "n";
            key = "<leader>tv";
            action = ":ToggleTerm direction=vertical<CR>";
          }
          {
            mode = "n";
            key = "<leader>th";
            action = ":ToggleTerm direction=horizontal<CR>";
          }
        ];

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

        # Project management
        projects.project-nvim = {
          enable = true;
          setupOpts.detection_methods = ["lsp" "pattern"];
        };
      };
    };
  };
}
