{ pkgs, ... }:
{
  # Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 10;
      efi.canTouchEfiVariables = true;
    };
    blacklistedKernelModules = [ "ucsi_ccg" ];
    kernelPackages = pkgs.linuxPackages_zen;
  };
}
