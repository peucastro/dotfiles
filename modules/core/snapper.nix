{ pkgs, ... }:
{
  services.snapper = {
    configs.home = {
      SUBVOLUME = "/home";
      ALLOW_USERS = [ "peu" ];
      TIMELINE_CREATE = true;
      TIMELINE_CLEANUP = true;

      TIMELINE_LIMIT_HOURLY = 3;
      TIMELINE_LIMIT_DAILY = 5;
      TIMELINE_LIMIT_WEEKLY = 2;
      TIMELINE_LIMIT_MONTHLY = 0;
      TIMELINE_LIMIT_YEARLY = 0;
    };

    snapshotRootOnBoot = false;
    snapshotInterval = "hourly";
    cleanupInterval = "daily";
    persistentTimer = true;
  };

  environment.systemPackages = with pkgs; [ snapper snapper-gui ];
}
