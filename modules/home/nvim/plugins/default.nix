{
  imports = [
    ./ai.nix
    ./blink.nix
    ./code.nix
    ./conform.nix
    ./editor.nix
    ./lint.nix
    ./lsp.nix
    ./nix.nix
    ./treesitter.nix
    ./ui.nix
    ./extra
  ];
  programs.nixvim.plugins = {
    lz-n.enable = true;
    web-devicons.enable = true;
    gitsigns.enable = true;
  };
}
