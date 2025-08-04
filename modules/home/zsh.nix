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
      ];
    };
    shellAliases = {
      zshconfig = "nvim ~/.zshrc";
      ohmyzsh = "nvim ~/.oh-my-zsh";
    };
  };
}
