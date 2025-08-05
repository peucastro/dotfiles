{pkgs, ...}: {
  home.packages = with pkgs; [
    gnomeExtensions.dash-to-dock
    gnomeExtensions.caffeine
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.vitals
    gnomeExtensions.impatience
    gnomeExtensions.alphabetical-app-grid
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
        "bitwarden.desktop"
        "org.gnome.Calendar.desktop"
        "obsidian.desktop"
        "spotify.desktop"
        "slack.desktop"
        "webcord.desktop"
        "code.desktop"
        "idea-ultimate.desktop"
        "com.mitchellh.ghostty.desktop"
        "startcenter.desktop"
        "org.gnome.Nautilus.desktop"
      ];
      enabled-extensions = [
        "dash-to-dock@micxgx.gmail.com"
        "caffeine@patapon.info"
        "clipboard-indicator@tudmotu.com"
        "Vitals@CoreCoding.com"
        "impatience@gfxmonk.net"
        "AlphabeticalAppGrid@stuarthayhurst"
      ];
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      show-battery-percentage = true;
    };
    "org/gnome/desktop/app-folders" = {
      folder-children = [
        "System"
        "Utilities"
        "Office"
      ];
    };
    "org/gnome/desktop/app-folders/folders/Office" = {
      name = "Office";
      apps = ["base.desktop" "calc.desktop" "draw.desktop" "impress.desktop" "math.desktop" "writer.desktop"];
    };
    "org/gnome/desktop/calendar" = {
      show-weekday = true;
    };
    "org/gnome/shell/app-switcher" = {
      current-workspace-only = true;
    };
    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-automatic = true;
    };
    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
    };
    "org/gnome/TextEditor" = {
      highlight-current-line = true;
      indent-style = "space";
      show-line-numbers = true;
      show-right-margin = false;
      style-scheme = "builder-dark";
      wrap-text = false;
    };
  };
}
