{inputs, ...}: {
  imports = [inputs.zen-browser.homeModules.beta];

  programs.zen-browser = {
    enable = true;
    policies = let
      mkLockedAttrs = builtins.mapAttrs (_: value: {
        Value = value;
        Status = "locked";
      });

      mkExtensionSettings = builtins.mapAttrs (_: pluginId: {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/${pluginId}/latest.xpi";
        installation_mode = "force_installed";
      });
    in {
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
      ExtensionSettings = mkExtensionSettings {
        "uBlock0@raymondhill.net" = "ublock-origin";
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = "bitwarden-password-manager";
        "languagetool-webextension@languagetool.org" = "languagetool";
        "{74145f27-f039-47ce-a470-a662b129930a}" = "clearurls";
        "firefox@tampermonkey.net" = "tampermonkey";
        "{c2c003ee-bd69-42a2-b0e9-6f34222cb046}" = "auto-tab-discard";
        "skipredirect@sblask" = "skip-redirect";
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

      Preferences = mkLockedAttrs {
        # General UI / usability
        "accessibility.force_disabled" = true;
        "browser.tabs.warnOnClose" = false;
        "browser.urlbar.trimURLs" = false;
        "browser.startup.homepage_override.mstone" = "ignore";
        "browser.shell.checkDefaultBrowser" = false;

        # Search / address bar
        "browser.urlbar.suggest.searches" = false;
        "browser.search.suggest.enabled" = false;

        # Privacy / tracking
        "network.cookie.cookieBehavior" = 1;
        "privacy.firstparty.isolate" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.pbmode.enabled" = true;
        "privacy.resistFingerprinting" = true;
        "beacon.enabled" = false;
        "dom.battery.enabled" = false;
        "webgl.disabled" = true;

        # Referrer policy
        "network.http.referer.XOriginPolicy" = 2;
        "network.http.referer.XOriginTrimmingPolicy" = 2;

        # Media / permissions
        "permissions.default.camera" = 1;
        "permissions.default.microphone" = 1;
        "permissions.default.geo" = 1;
        "media.peerconnection.enabled" = false;

        # Security
        "security.tls.version.min" = 3;
        "dom.security.https_only_mode" = true;

        # Telemetry / studies
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;

        # Passwords / signon
        "signon.rememberSignons" = false;

        # Shutdown sanitization
        "privacy.sanitize.sanitizeOnShutdown" = true;
        "privacy.clearOnShutdown.cookies" = true;
        "privacy.clearOnShutdown.cache" = true;
        "privacy.clearOnShutdown.history" = true;
        "privacy.clearOnShutdown.formdata" = true;
        "privacy.clearOnShutdown.sessions" = true;
        "privacy.clearOnShutdown.siteSettings" = false;

        # Disable risky features
        "extensions.translations.disabled" = true;
        "identity.fxaccounts.enabled" = false;
        "media.peerconnection.ice.default_address_only" = true;
      };
    };
  };
}
