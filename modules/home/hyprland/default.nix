{ pkgs, inputs, ... }:
{
  imports = [
    ./hypridle
    ./hyprlock
    ./hyprpolkitagent
    ./settings
    # ./caelestia
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    systemd = {
      enable = false;
      variables = [ "--all" ];
    };
  };
}
