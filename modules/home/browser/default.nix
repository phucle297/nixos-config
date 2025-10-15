{
  inputs,
  lib,
  pkgs,
  ...
}:
let
  # ---  CONFIGURATION  ---
  # Change your desired Catppuccin flavour here.
  # Options: "latte", "frappe", "macchiato", "mocha"
  flavour = "mocha";

  # Set to true for a more uniform completion widget.
  samecolorrows = false;
  # --- END CONFIGURATION ---

  # All Catppuccin palettes, translated into a Nix attribute set.
  palettes = {
    latte = {
      rosewater = "#dc8a78";
      flamingo = "#dd7878";
      pink = "#ea76cb";
      mauve = "#8839ef";
      red = "#d20f39";
      maroon = "#e64553";
      peach = "#fe640b";
      yellow = "#df8e1d";
      green = "#40a02b";
      teal = "#179299";
      sky = "#04a5e5";
      sapphire = "#209fb5";
      blue = "#1e66f5";
      lavender = "#7287fd";
      text = "#4c4f69";
      subtext1 = "#5c5f77";
      subtext0 = "#6c6f85";
      overlay2 = "#7c7f93";
      overlay1 = "#8c8fa1";
      overlay0 = "#9ca0b0";
      surface2 = "#acb0be";
      surface1 = "#bcc0cc";
      surface0 = "#ccd0da";
      base = "#eff1f5";
      mantle = "#e6e9ef";
      crust = "#dce0e8";
    };
    frappe = {
      rosewater = "#f2d5cf";
      flamingo = "#eebebe";
      pink = "#f4b8e4";
      mauve = "#ca9ee6";
      red = "#e78284";
      maroon = "#ea999c";
      peach = "#ef9f76";
      yellow = "#e5c890";
      green = "#a6d189";
      teal = "#81c8be";
      sky = "#99d1db";
      sapphire = "#85c1dc";
      blue = "#8caaee";
      lavender = "#babbf1";
      text = "#c6d0f5";
      subtext1 = "#b5bfe2";
      subtext0 = "#a5adce";
      overlay2 = "#949cbb";
      overlay1 = "#838ba7";
      overlay0 = "#737994";
      surface2 = "#626880";
      surface1 = "#51576d";
      surface0 = "#414559";
      base = "#303446";
      mantle = "#292c3c";
      crust = "#232634";
    };
    macchiato = {
      rosewater = "#f4dbd6";
      flamingo = "#f0c6c6";
      pink = "#f5bde6";
      mauve = "#c6a0f6";
      red = "#ed8796";
      maroon = "#ee99a0";
      peach = "#f5a97f";
      yellow = "#eed49f";
      green = "#a6da95";
      teal = "#8bd5ca";
      sky = "#91d7e3";
      sapphire = "#7dc4e4";
      blue = "#8aadf4";
      lavender = "#b7bdf8";
      text = "#cad3f5";
      subtext1 = "#b8c0e0";
      subtext0 = "#a5adcb";
      overlay2 = "#939ab7";
      overlay1 = "#8087a2";
      overlay0 = "#6e738d";
      surface2 = "#5b6078";
      surface1 = "#494d64";
      surface0 = "#363a4f";
      base = "#24273a";
      mantle = "#1e2030";
      crust = "#181926";
    };
    mocha = {
      rosewater = "#f5e0dc";
      flamingo = "#f2cdcd";
      pink = "#f5c2e7";
      mauve = "#cba6f7";
      red = "#f38ba8";
      maroon = "#eba0ac";
      peach = "#fab387";
      yellow = "#f9e2af";
      green = "#a6e3a1";
      teal = "#94e2d5";
      sky = "#89dceb";
      sapphire = "#74c7ec";
      blue = "#89b4fa";
      lavender = "#b4befe";
      text = "#cdd6f4";
      subtext1 = "#bac2de";
      subtext0 = "#a6adc8";
      overlay2 = "#9399b2";
      overlay1 = "#7f849c";
      overlay0 = "#6c7086";
      surface2 = "#585b70";
      surface1 = "#45475a";
      surface0 = "#313244";
      base = "#1e1e2e";
      mantle = "#181825";
      crust = "#11111b";
    };
  };

  # Select the correct palette based on the chosen flavour.
  palette = palettes.${flavour} or palettes.mocha;

in
{
  imports = [
    inputs.zen-browser.homeModules.twilight
  ];
  # programs.floorp = {
  #   enable = true;
  # };
  programs.qutebrowser = {
    enable = true;
    settings = lib.mkForce {
      # Completion
      colors.completion.category = {
        bg = palette.base;
        fg = palette.green;
        border.bottom = palette.mantle;
        border.top = palette.overlay2;
      };
      colors.completion.even.bg = palette.mantle;
      colors.completion.odd.bg = if samecolorrows then palette.mantle else palette.crust;
      colors.completion.fg = palette.subtext0;
      colors.completion.item.selected = {
        bg = palette.surface2;
        fg = palette.text;
        match.fg = palette.rosewater;
        border.bottom = palette.surface2;
        border.top = palette.surface2;
      };
      colors.completion.match.fg = palette.text;
      colors.completion.scrollbar = {
        bg = palette.crust;
        fg = palette.surface2;
      };

      # Downloads
      colors.downloads = {
        bar.bg = palette.base;
        error = {
          fg = palette.red;
          bg = palette.base;
        };
        start = {
          fg = palette.blue;
          bg = palette.base;
        };
        stop = {
          fg = palette.green;
          bg = palette.base;
        };
        system.bg = "none";
        system.fg = "none";
      };

      # Hints
      colors.hints = {
        bg = palette.peach;
        fg = palette.mantle;
        match.fg = palette.subtext1;
      };
      hints.border = "1px solid ${palette.mantle}";

      # Keyhints
      colors.keyhint = {
        bg = palette.mantle;
        fg = palette.text;
        suffix.fg = palette.subtext1;
      };

      # Messages
      colors.messages = {
        error = {
          bg = palette.overlay0;
          fg = palette.red;
          border = palette.mantle;
        };
        info = {
          bg = palette.overlay0;
          fg = palette.text;
          border = palette.mantle;
        };
        warning = {
          bg = palette.overlay0;
          fg = palette.peach;
          border = palette.mantle;
        };
      };

      # Prompts
      colors.prompts = {
        bg = palette.mantle;
        fg = palette.text;
        border = "1px solid ${palette.overlay0}";
        selected = {
          bg = palette.surface2;
          fg = palette.rosewater;
        };
      };

      # Statusbar
      colors.statusbar = {
        normal = {
          bg = palette.base;
          fg = palette.text;
        };
        insert = {
          bg = palette.crust;
          fg = palette.rosewater;
        };
        command = {
          bg = palette.base;
          fg = palette.text;
          private = {
            bg = palette.base;
            fg = palette.subtext1;
          };
        };
        caret = {
          bg = palette.base;
          fg = palette.peach;
          selection.fg = palette.peach;
        };
        progress.bg = palette.base;
        passthrough = {
          bg = palette.base;
          fg = palette.peach;
        };
        private = {
          bg = palette.mantle;
          fg = palette.subtext1;
        };
        url = {
          error.fg = palette.red;
          fg = palette.text;
          hover.fg = palette.sky;
          success.http.fg = palette.teal;
          success.https.fg = palette.green;
          warn.fg = palette.yellow;
        };
      };

      # Tabs
      colors.tabs = {
        bar.bg = palette.crust;
        even = {
          bg = palette.surface2;
          fg = palette.overlay2;
        };
        odd = {
          bg = palette.surface1;
          fg = palette.overlay2;
        };
        selected = {
          even = {
            bg = palette.base;
            fg = palette.text;
          };
          odd = {
            bg = palette.base;
            fg = palette.text;
          };
        };
        indicator = {
          error = palette.red;
          system = "none";
        };
      };

      # Context Menus
      colors.contextmenu = {
        menu = {
          bg = palette.base;
          fg = palette.text;
        };
        disabled = {
          bg = palette.mantle;
          fg = palette.overlay0;
        };
        selected = {
          bg = palette.overlay0;
          fg = palette.rosewater;
        };
      };
    };
  };
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
