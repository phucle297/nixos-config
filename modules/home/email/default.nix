{ pkgs, ... }:
{
  programs.thunderbird = {
    # enable = true;
  };
  home.packages = [
    # pkgs.thunderbird
  ];
}
