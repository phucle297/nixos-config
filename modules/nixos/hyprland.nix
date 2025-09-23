{ pkgs, inputs, ... }:
{
  programs.hyprland = {
    enable = true;
    # withUWSM = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
  # programs.uwsm = {
  #   enable = true;
  #   waylandCompositors = {
  #     hyprland = {
  #       prettyName = "Hyprland";
  #       comment = "Hyprland compositor managed by UWSM";
  #       binPath = "/run/current-system/sw/bin/Hyprland";
  #     };
  #   };
  # };
  environment.systemPackages = with pkgs; [
    libnotify
    qt5.qtwayland
    qt6.qtwayland
    wlogout
    wl-clipboard
    cachix
  ];
  # environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
