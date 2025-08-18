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

      # UI / defaults
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      DisablePocket = true;
    };
  };
}
