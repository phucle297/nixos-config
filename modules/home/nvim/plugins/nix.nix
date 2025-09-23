{
  programs.nixvim.plugins = {
    direnv.enable = true;
    nix.enable = true;
    nix-develop.enable = true;
    # for home-manager
    hmts.enable = true;
  };
}
