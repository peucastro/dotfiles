{ lib, pkgs, ... }:

let
  defaultExtensions = with pkgs.vscode-extensions; [
    adpyke.codesnap
    usernamehw.errorlens
    github.copilot
    github.copilot-chat
    eamodio.gitlens
    jdinhlife.gruvbox
    davidanson.vscode-markdownlint
    pkief.material-icon-theme
    pkief.material-product-icons
    jnoortheen.nix-ide
  ];

  defaultUserSettings = {
    "editor.fontFamily"              = "'JetBrains Mono'";
    "editor.fontSize"                = 18;
    "editor.lineHeight"              = 1.5;
    "diffEditor.ignoreTrimWhitespace" = false;
    "editor.accessibilitySupport"     = "off";
    "editor.folding"                 = false;
    "editor.formatOnPaste"           = true;
    "editor.formatOnSave"            = true;
    "editor.formatOnType"            = true;
    "editor.guides.bracketPairs"     = true;
    "editor.linkedEditing"           = true;
    "editor.minimap.enabled"         = false;
    "editor.renderLineHighlight"     = "gutter";
    "editor.renderWhitespace"        = "boundary";
    "editor.wordWrap"                = "on";
    "explorer.compactFolders"        = false;
    "explorer.sortOrderLexicographicOptions" = "unicode";
    "files.autoSave"                 = "afterDelay";
    "files.insertFinalNewline"      = true;
    "files.trimFinalNewlines"       = true;
    "files.trimTrailingWhitespace"   = true;
    "workbench.colorTheme"           = "Gruvbox Dark Hard";
    "workbench.iconTheme"            = "material-icon-theme";
    "workbench.productIconTheme"     = "material-product-icons";
    "workbench.sideBar.location"     = "right";
    "debug.console.closeOnEnd"       = true;
    "terminal.integrated.cursorBlinking" = true;
    "terminal.integrated.fontFamily" = "'FiraCode Nerd Font Mono'";
    "terminal.integrated.fontSize"   = 15;
    "extensions.autoUpdate"          = false;
    "extensions.ignoreRecommendations" = true;
    "github.copilot.enable"          = { "*" = false; };
    "gitlens.launchpad.indicator.enabled" = false;
    "gitlens.telemetry.enabled"      = false;
    "git.autofetch"                  = true;
    "git.blame.statusBarItem.enabled" = false;
    "git.openRepositoryInParentFolders" = "always";
    "telemetry.feedback.enabled"     = false;
    "telemetry.telemetryLevel"       = "off";
    "update.mode"                   = "manual";
    "window.zoomLevel"               = 0.25;
  };

  mkProfile = extra: {
    extensions = defaultExtensions ++ (extra.extensions or []);
    userSettings = lib.recursiveUpdate defaultUserSettings (extra.userSettings or {});
  };
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;

    profiles = {
      default = mkProfile {};

      python = mkProfile {
        extensions = with pkgs.vscode-extensions; [
          charliermarsh.ruff
          formulahendry.code-runner
          mechatroner.rainbow-csv
          ms-python.debugpy
          ms-python.isort
          ms-python.python
          ms-python.vscode-pylance
          ms-toolsai.jupyter
          ms-toolsai.jupyter-keymap
          ms-toolsai.jupyter-renderers
          ms-toolsai.vscode-jupyter-cell-tags
          ms-toolsai.vscode-jupyter-slideshow
        ];
        userSettings = {
          "[python]" = { "editor.defaultFormatter" = "charliermarsh.ruff"; };
        };
      };

      latex = mkProfile {
        extensions = with pkgs.vscode-extensions; [
          james-yu.latex-workshop
          streetsidesoftware.code-spell-checker
        ];
        userSettings = {
          "latex-workshop.formatting.latex"                = "tex-fmt";
          "latex-workshop.latex.autoClean.run"             = "onBuilt";
          "latex-workshop.latex.build.rootfileInStatus"    = true;
          "[latex]"                                        = { "editor.defaultFormatter" = "James-Yu.latex-workshop"; };
        };
      };

      webdev = mkProfile {
        extensions = with pkgs.vscode-extensions; [
          astro-build.astro-vscode
          bmewburn.vscode-intelephense-client
          bradlc.vscode-tailwindcss
          christian-kohler.path-intellisense
          esbenp.prettier-vscode
          ritwickdey.liveserver
          svelte.svelte-vscode
        ];
        userSettings = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
          "[astro]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
          "[php]"   = { "editor.defaultFormatter" = "bmewburn.vscode-intelephense-client"; };
        };
      };

      c-cpp = mkProfile {
        extensions = with pkgs.vscode-extensions; [
          xaver.clang-format
        ];
        userSettings = {
          "[c]"   = { "editor.defaultFormatter" = "xaver.clang-format"; };
          "[cpp]" = { "editor.defaultFormatter" = "xaver.clang-format"; };
          "makefile.configureOnOpen" = false;
          "editor.largeFileOptimizations" = false;
        };
      };

      flutter = mkProfile {
        extensions = with pkgs.vscode-extensions; [
          dart-code.flutter
          dart-code.dart-code
          jebbs.plantuml
        ];
        userSettings = {
          "dart.flutterCustomEmulators" = [
            {
              id = "pixel9";
              name = "Pixel 9";
              executable = "flutter";
              args = [ "emulator" "--launch" "Pixel_9" ];
            }
          ];
        };
      };
    };
  };
}
