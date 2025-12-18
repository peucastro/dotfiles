{
  services.displayManager = {
    enable = true;

    ly = {
      enable = true;
      settings = {
        allow_empty_password = false;
        animation = "matrix";
        asterisk = "0x2022";
        auth_fails = 5;
        bigclock = "en";
        clear_password = true;
        hibernate_cmd = "/run/current-system/systemd/bin/systemctl hibernate";
      };
    };
  };
}
