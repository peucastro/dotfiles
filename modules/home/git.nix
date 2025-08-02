{ username, ... }: {
  programs.git = {
    enable = true;

    userName = "Pedro Castro";
    userEmail = "falecompedroac@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      pull.ff = "only";
      color.ui = true;
      url = { "git@github.com:".insteadOf = [ "gh:" "https://github.com/" ]; };
      core.excludesFile = "/home/${username}/.config/git/.gitignore";
    };

    delta = {
      enable = true;
      options = {
        line-numbers = true;
        side-by-side = false;
        diff-so-fancy = true;
        navigate = true;
      };
    };
  };
}
