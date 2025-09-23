{ pkgs, ... }:
{
  programs.thunderbird = {
    enable = false;
  };
  home.packages = [
    pkgs.thunderbird
  ];
}
