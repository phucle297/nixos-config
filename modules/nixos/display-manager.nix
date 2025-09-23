{ pkgs, ... }:
let
  sddm-astronaut = pkgs.sddm-astronaut.override {
    themeConfig = {
      FormPosition = "left";
      ForceHideCompletePassword = true;
    };
    embeddedTheme = "pixel_sakura_static";
  };
in
{
  services.displayManager = {
    gdm.enable = false;
    sddm = {
      enable = true;
      wayland.enable = true;
      package = pkgs.kdePackages.sddm; # qt6 sddm version
      extraPackages = [ sddm-astronaut ];
      theme = "sddm-astronaut-theme";
    };
  };

  environment.systemPackages = [ sddm-astronaut ];
}
