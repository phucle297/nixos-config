{ pkgs, config, ... }:
{
  services.flameshot = {
    enable = true;
    package = (pkgs.flameshot.override { enableWlrSupport = true; });
    settings = {
      General = {
        showStartupLaunchMessage = false;

        # Auto save to this path
        savePath = "${config.home.homeDirectory}/Pictures/screenshots";
        savePathFixed = true;
        saveAsFileExtension = ".jpg";
        filenamePattern = "%F_%H-%M";
        drawThickness = 1;
        copyPathAfterSave = true;

        # For wayland
        useGrimAdapter = true;
        disabledGrimWarning = true;
      };
    };
  };
}
