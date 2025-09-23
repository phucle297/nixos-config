{ pkgs, ... }:
{
  services.swww.enable = false;

  home.packages = with pkgs; [
    (writeShellScriptBin "auto_wallpaper" (builtins.readFile ./auto_wallpaper.sh))
  ];
}
