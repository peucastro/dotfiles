{user, ...}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = user.displayName;
        inherit (user) email;
      };
      init.defaultBranch = "main";
      pull.ff = "only";
      color.ui = true;
      core.excludesFile = "/home/${user.login}/.config/git/.gitignore";
    };
    signing = {
      format = "ssh";
      key = "/home/${user.login}/.ssh/id_ed25519.pub";
      signByDefault = true;
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      line-numbers = true;
      side-by-side = false;
      diff-so-fancy = true;
      navigate = true;
    };
  };
}
