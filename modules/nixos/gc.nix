{
  nix.settings = {
    auto-optimise-store = true;
    cores = 8;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}
