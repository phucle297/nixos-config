{
  pkgs,
  lib,
  config,
  ...
}:
{
  # Install necessary packages for Rofi and its plugins
  home.packages = with pkgs; [
    bzmenu
    networkmanager_dmenu
    wtype
    rofi-power-menu
    rofi-calc
    rofi-pass-wayland
  ];

  # Rofi configuration
  programs.rofi = {
    enable = true;
    terminal = "kitty"; # Terminal emulator to use for run-shell-command
    package = pkgs.rofi;

    # List of Rofi modes (plugins) to enable
    modes = [
      "run"
      "drun"
      "window"
      "calc"
      {
        name = "rofi-power-menu";
        path = lib.getExe pkgs.rofi-power-menu;
      }
      {
        name = "pass";
        path = lib.getExe pkgs.rofi-pass-wayland;
      }
    ];

    # General configuration options
    extraConfig = {
      modi = "drun,run,window";
      "case-sensitive" = false;
      cycle = true;
      filter = "";
      "scroll-method" = 0;
      "normalize-match" = true;
      "show-icons" = true;
      "icon-theme" = "Oranchelo";
      "steal-focus" = false;
      matching = "normal";
      tokenize = true;
      "ssh-client" = "ssh";
      "ssh-command" = "{terminal} -e {ssh-client} {host} [-p {port}]";
      "parse-hosts" = true;
      "parse-known-hosts" = true;
      "drun-categories" = "";
      "drun-match-fields" = "name,generic,exec,categories,keywords";
      "drun-display-format" = "{name} [<span weight='light' size='small'><i>({generic})</i></span>]";
      "drun-show-actions" = false;
      "drun-url-launcher" = "xdg-open";
      "drun-use-desktop-cache" = false;
      "drun-reload-desktop-cache" = false;
      "run-command" = "{cmd}";
      "run-list-command" = "";
      "run-shell-command" = "{terminal} -e {cmd}";
      "window-match-fields" = "title,class,role,name,desktop";
      "window-command" = "wmctrl -i -R {window}";
      "window-format" = "{w} - {c} - {t:0}";
      "window-thumbnail" = false;
      "disable-history" = false;
      "sorting-method" = "normal";
      "max-history-size" = 25;
      "display-window" = "Windows";
      "display-windowcd" = "Window CD";
      "display-run" = "Run";
      "display-ssh" = "SSH";
      "display-drun" = "Apps";
      "display-combi" = "Combi";
      "display-keys" = "Keys";
      "display-filebrowser" = "Files";
      sort = false;
      threads = 0;
      "click-to-exit" = true;
      "terminal" = "kitty";
    };

    # Rofi-pass plugin configuration
    pass = {
      enable = true;
      package = pkgs.rofi-pass-wayland;
      stores = [
        "$HOME/.password-store"
      ];
      extraConfig = ''
        URL_FIELD='url'
        USERNAME_FIELD='user'
        AUTOTYPE_FIELD='autotype'

        kb_type_pass="Alt+p"
        kb_type_user="Alt+n"
      '';
    };

    # Theming and styling using mkForce to override any defaults
    theme = lib.mkForce (
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        # Global properties and color definitions.
        # Placing colors here makes them accessible via `var()`
        "*" = {
          font = "JetBrains Mono Nerd Font 12";
          background = mkLiteral "#1E2127FF";
          "background-alt" = mkLiteral "#282B31FF";
          foreground = mkLiteral "#FFFFFFFF";
          selected = mkLiteral "#61AFEFFF";
          active = mkLiteral "#98C379FF";
          urgent = mkLiteral "#E06C75FF";

          # These `var()` calls now successfully resolve
          "border-colour" = mkLiteral "var(selected)";
          "handle-colour" = mkLiteral "var(selected)";
          "background-colour" = mkLiteral "var(background)";
          "foreground-colour" = mkLiteral "var(foreground)";
          "alternate-background" = mkLiteral "var(background-alt)";
          "normal-background" = mkLiteral "var(background)";
          "normal-foreground" = mkLiteral "var(foreground)";
          "urgent-background" = mkLiteral "var(urgent)";
          "urgent-foreground" = mkLiteral "var(background)";
          "active-background" = mkLiteral "var(active)";
          "active-foreground" = mkLiteral "var(background)";
          "selected-normal-background" = mkLiteral "var(selected)";
          "selected-normal-foreground" = mkLiteral "var(background)";
          "selected-urgent-background" = mkLiteral "var(active)";
          "selected-urgent-foreground" = mkLiteral "var(background)";
          "selected-active-background" = mkLiteral "var(urgent)";
          "selected-active-foreground" = mkLiteral "var(background)";
          "alternate-normal-background" = mkLiteral "var(background)";
          "alternate-normal-foreground" = mkLiteral "var(foreground)";
          "alternate-urgent-background" = mkLiteral "var(urgent)";
          "alternate-urgent-foreground" = mkLiteral "var(background)";
          "alternate-active-background" = mkLiteral "var(active)";
          "alternate-active-foreground" = mkLiteral "var(background)";
        };

        # Main Window
        window = {
          transparency = "real";
          location = mkLiteral "center";
          anchor = mkLiteral "center";
          fullscreen = false;
          width = mkLiteral "800px";
          "x-offset" = mkLiteral "0px";
          "y-offset" = mkLiteral "0px";
          enabled = true;
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border = mkLiteral "0px solid";
          "border-radius" = mkLiteral "20px";
          "border-color" = mkLiteral "var(border-colour)";
          cursor = "default";
          "background-color" = mkLiteral "var(background-colour)";
        };

        # Main Box
        mainbox = {
          enabled = true;
          spacing = mkLiteral "10px";
          margin = mkLiteral "0px";
          padding = mkLiteral "40px";
          border = mkLiteral "0px solid";
          "border-radius" = mkLiteral "0px 0px 0px 0px";
          "border-color" = mkLiteral "var(border-colour)";
          "background-color" = mkLiteral "transparent";
          children = mkLiteral "[ \"inputbar\", \"message\", \"listview\", \"mode-switcher\" ]";
        };

        # Inputbar
        inputbar = {
          enabled = true;
          spacing = mkLiteral "10px";
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border = mkLiteral "0px solid";
          "border-radius" = mkLiteral "0px";
          "border-color" = mkLiteral "var(border-colour)";
          "background-color" = mkLiteral "transparent";
          "text-color" = mkLiteral "var(foreground-colour)";
          children = mkLiteral "[ \"prompt\", \"textbox-prompt-colon\", \"entry\" ]";
        };

        prompt = {
          enabled = true;
          "background-color" = mkLiteral "inherit";
          "text-color" = mkLiteral "inherit";
        };

        "textbox-prompt-colon" = {
          enabled = true;
          expand = false;
          str = "::";
          "background-color" = mkLiteral "inherit";
          "text-color" = mkLiteral "inherit";
        };

        entry = {
          enabled = true;
          "background-color" = mkLiteral "inherit";
          "text-color" = mkLiteral "inherit";
          cursor = "text";
          placeholder = "Search...";
          "placeholder-color" = mkLiteral "inherit";
        };

        "num-filtered-rows" = {
          enabled = true;
          expand = false;
          "background-color" = mkLiteral "inherit";
          "text-color" = mkLiteral "inherit";
        };
        "textbox-num-sep" = {
          enabled = true;
          expand = false;
          str = "/";
          "background-color" = mkLiteral "inherit";
          "text-color" = mkLiteral "inherit";
        };
        "num-rows" = {
          enabled = true;
          expand = false;
          "background-color" = mkLiteral "inherit";
          "text-color" = mkLiteral "inherit";
        };
        "case-indicator" = {
          enabled = true;
          "background-color" = mkLiteral "inherit";
          "text-color" = mkLiteral "inherit";
        };

        # Listview
        listview = {
          enabled = true;
          columns = mkLiteral "2";
          lines = mkLiteral "10";
          cycle = true;
          dynamic = true;
          scrollbar = true;
          layout = "vertical";
          reverse = false;
          "fixed-height" = true;
          "fixed-columns" = true;
          spacing = mkLiteral "5px";
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border = mkLiteral "0px solid";
          "border-radius" = mkLiteral "0px";
          "border-color" = mkLiteral "var(border-colour)";
          "background-color" = mkLiteral "transparent";
          "text-color" = mkLiteral "var(foreground-colour)";
          cursor = "default";
        };

        scrollbar = {
          "handle-width" = mkLiteral "10px";
          "handle-color" = mkLiteral "var(handle-colour)";
          "border-radius" = mkLiteral "10px";
          "background-color" = mkLiteral "var(alternate-background)";
        };

        # Elements (rows)
        element = {
          enabled = true;
          spacing = mkLiteral "10px";
          margin = mkLiteral "0px";
          padding = mkLiteral "5px 10px";
          border = mkLiteral "0px solid";
          "border-radius" = mkLiteral "20px";
          "border-color" = mkLiteral "var(border-colour)";
          "background-color" = mkLiteral "transparent";
          "text-color" = mkLiteral "var(foreground-colour)";
          cursor = "pointer";
        };

        "element normal.normal" = {
          "background-color" = mkLiteral "var(normal-background)";
          "text-color" = mkLiteral "var(normal-foreground)";
        };
        "element normal.urgent" = {
          "background-color" = mkLiteral "var(urgent-background)";
          "text-color" = mkLiteral "var(urgent-foreground)";
        };
        "element normal.active" = {
          "background-color" = mkLiteral "var(active-background)";
          "text-color" = mkLiteral "var(active-foreground)";
        };
        "element selected.normal" = {
          "background-color" = mkLiteral "var(selected-normal-background)";
          "text-color" = mkLiteral "var(selected-normal-foreground)";
        };
        "element selected.urgent" = {
          "background-color" = mkLiteral "var(selected-urgent-background)";
          "text-color" = mkLiteral "var(selected-urgent-foreground)";
        };
        "element selected.active" = {
          "background-color" = mkLiteral "var(selected-active-background)";
          "text-color" = mkLiteral "var(selected-active-foreground)";
        };
        "element alternate.normal" = {
          "background-color" = mkLiteral "var(alternate-normal-background)";
          "text-color" = mkLiteral "var(alternate-normal-foreground)";
        };
        "element alternate.urgent" = {
          "background-color" = mkLiteral "var(alternate-urgent-background)";
          "text-color" = mkLiteral "var(alternate-urgent-foreground)";
        };
        "element alternate.active" = {
          "background-color" = mkLiteral "var(alternate-active-background)";
          "text-color" = mkLiteral "var(alternate-active-foreground)";
        };

        "element-icon" = {
          "background-color" = mkLiteral "transparent";
          "text-color" = mkLiteral "inherit";
          size = mkLiteral "24px";
          cursor = mkLiteral "inherit";
        };

        "element-text" = {
          "background-color" = mkLiteral "transparent";
          "text-color" = mkLiteral "inherit";
          highlight = mkLiteral "inherit";
          cursor = mkLiteral "inherit";
          "vertical-align" = mkLiteral "0.5";
          "horizontal-align" = mkLiteral "0.0";
        };

        # Mode Switcher
        "mode-switcher" = {
          enabled = true;
          spacing = mkLiteral "10px";
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border = mkLiteral "0px solid";
          "border-radius" = mkLiteral "0px";
          "border-color" = mkLiteral "var(border-colour)";
          "background-color" = mkLiteral "transparent";
          "text-color" = mkLiteral "var(foreground-colour)";
        };

        button = {
          padding = mkLiteral "5px 10px";
          border = mkLiteral "0px solid";
          "border-radius" = mkLiteral "20px";
          "border-color" = mkLiteral "var(border-colour)";
          "background-color" = mkLiteral "var(alternate-background)";
          "text-color" = mkLiteral "inherit";
          cursor = "pointer";
        };

        "button selected" = {
          "background-color" = mkLiteral "var(selected-normal-background)";
          "text-color" = mkLiteral "var(selected-normal-foreground)";
        };

        # Message
        message = {
          enabled = true;
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border = mkLiteral "0px solid";
          "border-radius" = mkLiteral "0px 0px 0px 0px";
          "border-color" = mkLiteral "var(border-colour)";
          "background-color" = mkLiteral "transparent";
          "text-color" = mkLiteral "var(foreground-colour)";
        };

        textbox = {
          padding = mkLiteral "5px 10px";
          border = mkLiteral "0px solid";
          "border-radius" = mkLiteral "20px";
          "border-color" = mkLiteral "var(border-colour)";
          "background-color" = mkLiteral "var(alternate-background)";
          "text-color" = mkLiteral "var(foreground-colour)";
          "vertical-align" = mkLiteral "0.5";
          "horizontal-align" = mkLiteral "0.0";
          highlight = mkLiteral "none";
          "placeholder-color" = mkLiteral "var(foreground-colour)";
          blink = true;
          markup = true;
        };

        "error-message" = {
          padding = mkLiteral "10px";
          border = mkLiteral "2px solid";
          "border-radius" = mkLiteral "20px";
          "border-color" = mkLiteral "var(border-colour)";
          "background-color" = mkLiteral "var(background-colour)";
          "text-color" = mkLiteral "var(foreground-colour)";
        };
      }
    );
  };
}
