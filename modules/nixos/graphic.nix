{ config, pkgs, ... }:
{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    amdgpu.amdvlk = {
      enable = true;
      support32Bit.enable = true;
    };
  };
  # services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.nvidia = {
    open = true;
    nvidiaSettings = true;
    powerManagement = {
      enable = true;
    };
    # modesetting.enable = true;
  };
  # services.xserver.videoDrivers = [ "nvidia" ];
}
