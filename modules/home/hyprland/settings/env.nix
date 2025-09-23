{
  wayland.windowManager.hyprland.settings.env = [
    # "LIBVA_DRIVER_NAME,nvidia"
    "SDL_VIDEODRIVER,wayland"
    "WLR_DRM_NO_ATOMIC,1"
    # "__GLX_VENDOR_LIBRARY_NAME,nvidia"
    "__NV_PRIME_RENDER_OFFLOAD,1"
    # "__VK_LAYER_NV_optimus,NVIDIA_only"
    # FOR VM and POSSIBLY NVIDIA
    "WLR_NO_HARDWARE_CURSORS,1"
    "WLR_RENDERER_ALLOW_SOFTWARE,1"
    # nvidia firefox (for hardware acceleration on FF)?
    # check this post https://github.com/elFarto/nvidia-vaapi-driver#configuration
    "MOZ_DISABLE_RDD_SANDBOX,1"
    "EGL_PLATFORM,wayland"
    # Disable appimage launcher by default
    "APPIMAGELAUNCHER_DISABLE,1"
    # Ozone
    "OZONE_PLATFORM,wayland"
    "ELECTRON_OZONE_PLATFORM_HINT,wayland"
    "WLR_RENDERER,vulkan"
  ];
}
