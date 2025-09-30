{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # GUI
    vlc
    wl-mirror
    # xfce.thunar
    kdePackages.dolphin
    teams-for-linux
    slack
    imv
    dbeaver-bin
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
