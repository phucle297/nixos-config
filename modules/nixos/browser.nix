{
  programs.chromium = {
    enable = true;
    homepageLocation = "https://www.startpage.com";
    extensions = [
      "aapbdbdomjkkjkaonfhkkikfgjllcleb;https://clients2.google.com/service/update2/crx" # google translate
      "dbepggeogbaibhgnhhndojpepiihcmeb" # vimium
      "ddkjiahejlhfcafbddmgiahcphecmpfh" # ublock origin
      "pkehgijcmpdhfbdbbnkijodmdjhbjlgp" # Privacy Badger
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # dark reader
      "naepdomgkenhinolocfifgehidddafch" # browserpass

      "fmkadmapgofadopljbjfkapdkoienihi" # react dev tools
    ];
    extraOpts = {
      "BrowserSignin" = 0;
      "SyncDisabled" = true;
      "PasswordManagerEnabled" = false;
      "SpellcheckEnabled" = true;
      "SpellcheckLanguage" = [
        "en-US"
      ];
      "RestoreOnStartup" = 1;
      "PrivacySandboxAdMeasurementEnabled" = false;
      "PrivacySandboxAdTopicsEnabled" = false;
      "PrivacySandboxFingerprintingProtectionEnabled" = true;
      "PrivacySandboxIpProtectionEnabled" = true;
      "PrivacySandboxPromptEnabled" = false;
      "PrivacySandboxSiteEnabledAdsEnabled" = false;

      "ShowHomeButton" = false;
      "CloudReportingEnabled" = false;
      "ReportSafeBrowsingData" = false;
      "PromotionalTabsEnabled" = false;
      "MetricsReportingEnabled" = false;
      "PaymentMethodQueryEnabled" = false;

      "AutofillAddressEnabled" = false;
      "AutofillCreditCardEnabled" = false;

    };
  };
}
