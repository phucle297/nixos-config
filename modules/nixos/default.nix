{
  imports = [
    ./boot.nix
    ./browser.nix
    ./display-manager.nix
    ./fonts.nix
    ./bluetooth.nix
    ./container.nix
    ./hyprland.nix
    ./password.nix
    ./i18n.nix
    ./niri.nix
    # ./keyboard
    ./networking.nix
    ./graphic.nix
    ./gc.nix
    ./packages.nix
    ./polkit.nix
    ./sound.nix
    # ./secrets.nix
    ./theme.nix
    ./time.nix
    ./user.nix
    ./xdg.nix
    ./security.nix
    ./stylix.nix
    ./steam.nix
    # ./vpn.nix
  ];

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };
}
