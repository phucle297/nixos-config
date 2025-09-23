{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.stylix.nixosModules.stylix
  ];
  stylix = {
    enable = true;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-mirage.yaml";
    fonts = {
      sansSerif.name = "Noto Serif";
      monospace.name = "CaskaydiaCove Nerd Font";
      sizes = {
        applications = 13;
        desktop = 13;
        popups = 13;
        terminal = 13;
      };
    };
    polarity = "dark";
    opacity = {
      desktop = 1.0;
      terminal = 0.9;
    };
  };
}
