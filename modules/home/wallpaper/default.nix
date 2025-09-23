{ pkgs, ... }:
{
  services.swww.enable = true;

  home.packages = with pkgs; [
    (writeShellScriptBin "auto_wallpaper" (builtins.readFile ./auto_wallpaper.sh))
  ];
}
