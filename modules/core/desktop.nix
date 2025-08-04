{pkgs, ...}: {
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    epiphany
    decibels
    gedit
    geary
    totem
    yelp
    simple-scan
    gnome-console
    gnome-calculator
    gnome-music
    gnome-maps
    gnome-photos
    gnome-contacts
    gnome-characters
    gnome-system-monitor
    gnome-weather
    gnome-tour
    gnome-connections
    # gnome-settings
  ];
}
