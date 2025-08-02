{ user, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "fzf"
        "gh"
        "git"
        "man"
        "sudo"
        "tldr"
        "z"
        "zsh-syntax-highlighting"
        "zsh-autosuggestions"
      ];
    };
    shellAliases = {
      zshconfig = "nvim ~/.zshrc";
      ohmyzsh = "nvim ~/.oh-my-zsh";
    };
    envExtra = ''
      export ANDROID_HOME="$HOME/Android/Sdk/platform-tools"
      export NVM_DIR="$HOME/.nvm"
      export PNPM_HOME="$HOME/.local/share/pnpm"
      export SDKMAN_DIR="$HOME/.sdkman"
      export PATH="$PATH:$ANDROID_HOME"
      export PATH="$PATH:$HOME/development/flutter/bin"
      export PATH="$PATH:$HOME/.pub-cache/bin"
    '';
    initContent = ''
      zstyle ':omz:update' mode reminder

      # Preferred editor for local and remote sessions
      if [[ -n $SSH_CONNECTION ]]; then
        export EDITOR='vim'
      else
        export EDITOR='nvim'
      fi

      # nvm
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

      # pnpm
      case ":$PATH:" in
        *":$PNPM_HOME:"*) ;;
        *) export PATH="$PATH:$PNPM_HOME" ;;
      esac

      # sdkman
      [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
    '';
  };
}
