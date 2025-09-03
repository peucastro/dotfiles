{
  services.snapper = {
    configs.home = {
      SUBVOLUME = "/home";
      TIMELINE_LIMIT_DAILY = 7;
      TIMELINE_LIMIT_WEEKLY = 3;
      TIMELINE_LIMIT_MONTHLY = 2;
      NUMBER_CLEANUP = true;
    };
  };
}
