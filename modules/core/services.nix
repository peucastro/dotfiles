{pkgs, ...}: {
  services = {
    gnome.gnome-keyring.enable = true;

    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd sway";
          user = "greeter";
        };
      };
    };
  };

  users.users.greeter = {
    isSystemUser = true;
    group = "greeter";
  };
  users.groups.greeter = {};

  environment.systemPackages = with pkgs; [
    tuigreet
  ];
}
