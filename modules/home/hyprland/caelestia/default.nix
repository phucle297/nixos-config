{ inputs, ... }:
{
  imports = [
    inputs.caelestia-shell.homeManagerModules.default

    ./animation.nix
    ./keybind.nix
  ];
  # caelestia
  stylix.targets.qt.enable = false;
  stylix.targets.gtk.enable = false;
  programs.caelestia = {
    enable = true;
    systemd = {
      enable = true; # if you prefer starting from your compositor
      target = "graphical-session.target";
      environment = [ ];
    };
    settings = {
      appearance = {
        transparency.enabled = true;
      };
      bar = {
        entries = [
          {
            "id" = "logo";
            "enabled" = true;
          }
          {
            "id" = "workspaces";
            "enabled" = true;
          }
          {
            "id" = "spacer";
            "enabled" = true;
          }
          {
            "id" = "activeWindow";
            "enabled" = true;
          }
          {
            "id" = "spacer";
            "enabled" = true;
          }
          {
            "id" = "tray";
            "enabled" = false;
          }
          {
            "id" = "clock";
            "enabled" = true;
          }
          {
            "id" = "statusIcons";
            "enabled" = true;
          }
          {
            "id" = "power";
            "enabled" = true;
          }
          {
            "id" = "idleInhibitor";
            "enabled" = false;
          }
        ];
        status = {
          showBattery = false;
          showNetwork = false;
        };
      };
      paths.wallpaperDir = "~/Pictures/wallpapers";
    };
    cli = {
      enable = true; # Also add caelestia-cli to path
    };
  };
}
