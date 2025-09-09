{
  services.snapper = {
    configs.home = {
      SUBVOLUME = "/home";
      TIMELINE_LIMIT_DAILY = 5;
      TIMELINE_LIMIT_WEEKLY = 3;
      TIMELINE_LIMIT_QUARTERLY = 0;
      TIMELINE_LIMIT_MONTHLY = 2;
      TIMELINE_LIMIT_YEARLY = 0;
      NUMBER_CLEANUP = true;
      TIMELINE_CREATE = true;
      TIMELINE_CLEANUP = true;
    };
  };
}
