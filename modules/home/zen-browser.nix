{inputs, ...}: {
  imports = [inputs.zen-browser.homeModules.beta];

  programs.zen-browser = {
    enable = true;
    policies = {
      # Autofill / form behavior
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      OfferToSaveLogins = false;
      PasswordManagerEnabled = false;

      # Updates / studies / telemetry
      DisableAppUpdate = false;
      DisableFirefoxStudies = true;
      DisableTelemetry = true;
      DisableFeedbackCommands = true;

      # Sync / Accounts
      DisableFirefoxAccounts = true;
      DisableSync = true;
      DisableSignInToSync = true;

      # Content, privacy & tracking protection
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
        EmailTracking = true;
      };
      DoNotTrackEnabled = true;
      SafeBrowsingEnabled = true;

      # Cookies / storage
      Cookies = {
        Behavior = "reject-tracker-and-partition-foreign";
        Locked = true;
      };

      # HTTPS / DNS
      HttpsOnlyMode = "force_enabled";
      DNSOverHTTPS = {
        Enabled = true;
        ProviderURL = "https://1.1.1.1/dns-query";
        Locked = true;
      };

      # Extensions
      ExtensionSettings = {
        "*" = {
          installation_mode = "blocked";
        };

        "uBlock0@raymondhill.net" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        };
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
        };
        "languagetool-webextension@languagetool.org" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/languagetool/latest.xpi";
        };
        "{74145f27-f039-47ce-a470-a662b129930a}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi";
        };
        "firefox@tampermonkey.net" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/tampermonkey/latest.xpi";
        };
        "{c2c003ee-bd69-42a2-b0e9-6f34222cb046}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/auto-tab-discard/latest.xpi";
        };
        "skipredirect@sblask" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/skip-redirect/latest.xpi";
        };
        "chrome-gnome-shell@gnome.org" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/gnome-shell-integration/latest.xpi";
        };
      };

      # UI / defaults
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      DisablePocket = true;

      # Bookmarks
      ManagedBookmarks = [
        {URL = "https://web.whatsapp.com";}
        {URL = "https://messages.google.com/web/conversations";}
        {URL = "https://www.linkedin.com";}
        {URL = "https://www.sofascore.com";}
        {URL = "https://www.reddit.com";}
        {URL = "https://www.cifraclub.com.br";}
        {URL = "https://www.goodreads.com";}
        {URL = "https://anilist.co/home";}
        {URL = "https://www.primevideo.com/region/eu/storefront";}
        {URL = "https://www.youtube.com";}
        {URL = "https://www.google.com/maps";}
        {URL = "https://gemini.google.com/app";}
        {URL = "https://mail.google.com/mail/u/0/#inbox";}
        {URL = "https://drive.google.com/drive/u/0";}
        {URL = "https://calendar.google.com/calendar/u/0";}
        {URL = "https://photos.google.com";}
        {URL = "https://docs.google.com/document/u/0";}
        {URL = "https://docs.google.com/spreadsheets/u/0";}
        {URL = "https://docs.google.com/presentation/u/0";}
        {URL = "https://play.google.com/books";}
        {URL = "https://accio.pt/home";}
        {URL = "https://www.figma.com";}
        {URL = "https://www.notion.so";}
        {URL = "https://fast.com/pt";}
      ];
    };
  };
}
