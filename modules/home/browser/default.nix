{
  inputs,
  lib,
  pkgs,
  ...
}:
let
  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };
in
{
  imports = [
    inputs.zen-browser.homeModules.twilight
  ];
  # programs.floorp = {
  #   enable = true;
  # };
  programs.zen-browser = {
    enable = true;
    languagePacks = [ "en-US" ];

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      Homepage.StartPage = "previous-session";
      DisplayMenuBar = "never"; # Previously appeared when pressing alt
    };
    # any other options under `programs.firefox` are also supported here.
    # see `man home-configuration.nix`.
  };
  # programs.firefox = {
  #   enable = true;
  #   languagePacks = [ "en-US" ];
  #   # betterfox = {
  #   #   enable = true;
  #   #   version = "main"; # Set version here, defaults to main branch
  #   # };
  #   policies = {
  #     DisableTelemetry = true;
  #     DisableFirefoxStudies = true;
  #     EnableTrackingProtection = {
  #       Value = true;
  #       Locked = true;
  #       Cryptomining = true;
  #       Fingerprinting = true;
  #     };
  #     Homepage.StartPage = "previous-session";
  #     DisplayMenuBar = "never"; # Previously appeared when pressing alt
  #     # ---- EXTENSIONS ----
  #     # Check about:support for extension/add-on ID strings.
  #     # Valid strings for installation_mode are "allowed", "blocked",
  #     # "force_installed" and "normal_installed".
  #     ExtensionSettings =
  #       with builtins;
  #       let
  #         extension = shortId: uuid: {
  #           name = uuid;
  #           value = {
  #             install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
  #             installation_mode = "normal_installed";
  #           };
  #         };
  #       in
  #       listToAttrs [
  #         (extension "ublock-origin" "uBlock0@raymondhill.net")
  #         (extension "decentraleyes" "jid1-BoFifL9Vbdl2zQ@jetpack")
  #         (extension "privacy-badger17" "jid1-MnnxcxisBPnSXQ@jetpack")
  #         (extension "auto-tab-discard" "{c2c003ee-bd69-42a2-b0e9-6f34222cb046}")
  #         (extension "darkreader" "addon@darkreader.org")
  #         (extension "traduzir-paginas-web" "{036a55b4-5e72-4d05-a06c-cba2dfcc134a}")
  #         (extension "clearurls" "{74145f27-f039-47ce-a470-a662b129930a}")
  #         (extension "tridactyl-vim" "tridactyl.vim@cmcaine.co.uk")
  #         (extension "multi-account-containers" "@testpilot-containers")
  #         (extension "facebook-container" "@contain-facebook")
  #         (extension "firefox-color" "FirefoxColor@mozilla.com")
  #         (extension "browserpass-ce" "browserpass@maximbaz.com")
  #         (extension "react-devtools" "@react-devtools")
  #       ];
  #     "3rdparty".Extensions = {
  #       # https://github.com/gorhill/uBlock/blob/master/platform/common/managed_storage.json
  #       "uBlock0@raymondhill.net".adminSettings = {
  #         userSettings = rec {
  #           uiTheme = "dark";
  #           uiAccentCustom = true;
  #           uiAccentCustom0 = "#8300ff";
  #           # FIXME-PURITY(Krey): These should be managed in declarative way
  #           importedLists = [
  #             "https://filters.adtidy.org/extension/ublock/filters/3.txt"
  #             "https://github.com/DandelionSprout/adfilt/raw/master/LegitimateURLShortener.txt"
  #           ];
  #           externalLists = lib.concatStringsSep "\n" importedLists;
  #         };
  #         selectedFilterLists = [
  #           "CZE-0"
  #           "adguard-generic"
  #           "adguard-annoyance"
  #           "adguard-social"
  #           "adguard-spyware-url"
  #           "easylist"
  #           "easyprivacy"
  #           # FIXME-PURITY(Krey): Should be declarative
  #           "https://github.com/DandelionSprout/adfilt/raw/master/LegitimateURLShortener.txt"
  #           "plowe-0"
  #           "ublock-abuse"
  #           "ublock-badware"
  #           "ublock-filters"
  #           "ublock-privacy"
  #           "ublock-quick-fixes"
  #           "ublock-unbreak"
  #           "urlhaus-1"
  #         ];
  #       };
  #     };
  #
  #     # ---- PREFERENCES ----
  #     # Check about:config for options.
  #     Preferences = {
  #       "browser.contentblocking.category" = {
  #         Value = "strict";
  #         Status = "locked";
  #       };
  #       "extensions.pocket.enabled" = lock-false;
  #       "extensions.screenshots.disabled" = lock-true;
  #       "browser.topsites.contile.enabled" = lock-false;
  #       "browser.formfill.enable" = lock-false;
  #       "browser.search.suggest.enabled" = lock-false;
  #       "browser.search.suggest.enabled.private" = lock-false;
  #       "browser.urlbar.suggest.searches" = lock-false;
  #       "browser.urlbar.showSearchSuggestionsFirst" = lock-false;
  #       "browser.urlbar.placeholderName" = "DuckDuckGo";
  #       "browser.urlbar.placeholderName.private" = "DuckDuckGo";
  #       "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
  #       "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
  #       "browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
  #       "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lock-false;
  #       "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lock-false;
  #       "browser.newtabpage.activity-stream.section.highlights.includeVisited" = lock-false;
  #       "browser.newtabpage.activity-stream.showSponsored" = lock-false;
  #       "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
  #       "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
  #       "browser.startup.page" = "3";
  #       "toolkit.legacyUserProfileCustomizations.stylesheets" = lock-true;
  #       "layers.acceleration.force-enabled" = lock-true;
  #       "gfx.webrender.all" = lock-true;
  #       "gfx.webrender.enabled" = lock-true;
  #       "layout.css.backdrop-filter.enabled" = lock-true;
  #       "svg.context-properties.content.enabled" = lock-true;
  #       "sidebar.revamp" = lock-false;
  #     };
  #   };
  #
  #   profiles.default = {
  #     # betterfox = {
  #     #   enable = true;
  #     #   # Set this to enable all sections by default
  #     #   enableAllSections = true;
  #     # };
  #     search = {
  #       force = true;
  #       default = "google";
  #       order = [
  #         "ddg"
  #         "searx"
  #         "perp"
  #         "google"
  #       ];
  #       engines = {
  #         searx = {
  #           name = "SearXNG";
  #           urls = [
  #             {
  #               template = "https://opnxng.com/search?q={searchTerms}&language=all&time_range=&safesearch=0&categories=general";
  #             }
  #           ];
  #           definedAliases = [ "@s" ];
  #         };
  #         perp = {
  #           name = "Perplexity";
  #           urls = [
  #             {
  #               template = "https://www.perplexity.ai/search/?q={searchTerm}";
  #             }
  #           ];
  #           definedAliases = [ "@p" ];
  #         };
  #       };
  #     };
  #   };
  # };
  stylix.targets.zen-browser.profileNames = [ "default" ];

  programs.chromium = {
    enable = true;
    # package = pkgs.ungoogled-chromium;

    # extensions = [
    #   {
    #     id = "aapbdbdomjkkjkaonfhkkikfgjllcleb"; # google translate
    #   }
    #   {
    #     id = "dbepggeogbaibhgnhhndojpepiihcmeb"; # vimium
    #   }
    #   {
    #     id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; # ublock origin
    #   }
    #   {
    #     id = "chlffgpmiacpedhhbkiomidkjlcfhogd"; # pushbullet
    #   }
    #   {
    #     id = "liecbddmkiiihnedobmlmillhodjkdmb"; # Privacy Badger
    #   }
    #   {
    #     id = "mbniclmhobmnbdlbpiphghaielnnpgdp"; # lightshot
    #   }
    #   {
    #     id = "gcbommkclmclpchllfjekcdonpmejbdp"; # https everywhere
    #   }
    #   {
    #     id = "aeblfdkhhhdcdjpifhhbdiojplfjncoa"; # dark reader
    #   }
    # ];
  };
}
