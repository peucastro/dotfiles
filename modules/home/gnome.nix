{pkgs, ...}: {
  home.packages = with pkgs.gnomeExtensions; [
    dash-to-dock
    caffeine
    clipboard-indicator
    vitals
    impatience
    alphabetical-app-grid
    places-status-indicator
    applications-menu
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
        "places-menu@gnome-shell-extensions.gcampax.github.com"
        "apps-menu@gnome-shell-extensions.gcampax.github.com"
      ];
    };
    "org/gnome/shell/extensions/alphabetical-app-grid" = {
      folder-order-position = "start";
    };
    "org/gnome/shell/extensions/caffeine" = {
      show-notifications = false;
      toggle-shortcut = ["<Control><Super>c"];
    };
    "org/gnome/shell/extensions/dash-to-dock" = {
      dash-max-icon-size = 36;
      show-mounts-only-mounted = false;
      show-mounts-network = true;
    };
    "org/gnome/shell/extensions/net/gfxmonk/impatience" = {
      speed-factor = 0.25;
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
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
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Control><Alt>t";
      command = "ghostty";
      name = "Open the terminal";
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
