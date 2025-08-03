{
  programs.bash = {
    enable = true;
    shellAliases = {
      ls = "ls --color=auto";
      grep = "grep --color=auto";
    };
    bashrcExtra = ''
      PS1='[\u@\h \W]\$ '
    '';
    initExtra = ''
      # Environment variables
      export ANDROID_HOME="$HOME/Android/Sdk/platform-tools"
      export NVM_DIR="$HOME/.nvm"
      export PNPM_HOME="$HOME/.local/share/pnpm"
      export SDKMAN_DIR="$HOME/.sdkman"
      export PATH="$PATH:$ANDROID_HOME"
      export PATH="$PATH:$HOME/development/flutter/bin"
      export PATH="$PATH:$HOME/.pub-cache/bin"

      # nvm
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
      [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

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
