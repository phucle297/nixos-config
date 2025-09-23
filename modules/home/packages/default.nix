{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # GUI
    vlc
    xfce.thunar
    teams-for-linux
    slack
    imv
    # jetbrains.datagrip
    # microsoft-edge

    # TUI
    mycli

    # Cli
    git-standup
    git-secret
    httpie
    nix-prefetch-github
    nix-prefetch-git
  ];
}
