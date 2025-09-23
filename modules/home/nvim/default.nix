{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./plugins
    ./keymaps
    ./options.nix
    ./performance.nix
  ];
  programs.nixvim = {
    enable = true;
    dependencies = {
      bat.enable = true;
      gcc.enable = true;
    };
  };
}
