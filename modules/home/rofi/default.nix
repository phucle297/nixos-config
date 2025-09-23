{ pkgs
, lib
, config
, ...
}:
{
  home.packages = with pkgs; [
    bzmenu
    networkmanager_dmenu
    wtype
  ];
  programs.rofi = {
    modes = [
      "run"
      "drun"
      "window"
      "calc"
      {
        name = "rofi-power-menu";
        path = lib.getExe pkgs.rofi-power-menu;
      }
    ];
    enable = true;
    terminal = "kitty";
    package = pkgs.rofi; # wayland support
    plugins = with pkgs; [
      rofi-calc
      rofi-power-menu
    ];
    extraConfig = {
      icon-theme = "Oranchelo";
      show-icons = true;
    };
    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        "*" = {
          font = "JetBrains Mono Nerd Font 12";
          margin = 0;
          padding = 0;
          spacing = 0;
        };
        "window" = {
          location = mkLiteral "center";
          width = mkLiteral "640";
          border-radius = mkLiteral "8";
        };

        "inputbar" = {
          enabled = true;
          spacing = mkLiteral "12px";
          padding = mkLiteral "12px";
          children = map mkLiteral [
            "icon-search"
            "entry"
          ];
        };
        "icon-search" = {
          expand = false;
          filename = "search";
          size = mkLiteral "28px";
        };
        "icon-search, entry, element-icon, element-text " = {
          vertical-align = mkLiteral "0.5";
        };

        entry = {
          placeholder = "Search";
        };

        message = {
          border = mkLiteral "2px 0 0";
        };

        textbox = {
          padding = mkLiteral "8px 24px";
        };

        listview = {
          lines = mkLiteral "10";
          columns = mkLiteral "1";

          fixed-height = false;
          border = mkLiteral "1px 0 0";
        };

        element = {
          padding = mkLiteral "8px 16px";
          spacing = mkLiteral "16px";
        };
        element-icon = {
          size = mkLiteral "1em";
        };
      };
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
  };
}
