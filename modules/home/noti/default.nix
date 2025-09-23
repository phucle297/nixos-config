{
  services.fnott = {
    enable = false;
    settings = {
      main = {
        min-width = "200";
        max-width = "400";
        max-height = "150";
        border-radius = "8";
        max-timeout = "3";
        selection-helper = "rofi";
        selection-helper-uses-null-separator = true;
      };
    };
  };

  services.mako = {
    enable = true;
    settings = {
      actions = true;
      anchor = "top-center";

      border-radius = "8";
      border-size = "1";
      padding = "10";
      margin = "10, 4, 0, 0";

      default-timeout = 5000;
      icons = true;
      max-visible = 3;
      on-notify = "exec makoctl menu rofi -- -dmenu";

      "app-name=teams-for-linux" = {
        on-notify = "none";
      };

      "app-name=slack" = {
        on-notify = "none";
      };

      "app-name=thunderbird" = {
        on-notify = "none";
      };

      "app-name=\"NetworkManager Applet\"" = {
        on-notify = "none";
      };
    };
  };
}
