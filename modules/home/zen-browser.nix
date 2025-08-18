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
        "bitwarden-password-manager@mozilla" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
        };
        "languagetool@languagetool.org" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/languagetool/latest.xpi";
        };
        "authenticator@gsuite" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/authenticator/latest.xpi";
        };
        "clearurls@absolut.k" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi";
        };
        "tampermonkey@tampermonkey.net" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/tampermonkey/latest.xpi";
        };
        "auto-tab-discard@mik-stu" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/auto-tab-discard/latest.xpi";
        };
        "skip-redirect@bogachenko" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/skip-redirect/latest.xpi";
        };
        "gnome-shell-integration@gnome" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/gnome-shell-integration/latest.xpi";
        };
      };

      # UI / defaults
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      DisablePocket = true;
    };
  };
}
