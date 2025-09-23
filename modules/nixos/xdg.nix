{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    wlr.enable = false;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      # xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };
}
