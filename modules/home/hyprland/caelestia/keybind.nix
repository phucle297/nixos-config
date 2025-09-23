{
  wayland.windowManager.hyprland = {
    settings = {
      "$mod" = "SUPER";
      "$alt" = "ALT";
      bindl = [
        ", XF86MonBrightnessUp, global, caelestia:brightnessUp"
        ", XF86MonBrightnessDown, global, caelestia:brightnessDown"
        ", XF86AudioPlay, global, caelestia:mediaToggle"
        ", XF86AudioPause, global, caelestia:mediaToggle"
        ", XF86AudioNext, global, caelestia:mediaNext"
        ", XF86AudioPrev, global, caelestia:mediaPrev"
        ", XF86AudioStop, global, caelestia:mediaStop"
      ];
      bind = [
        "$mod, U, workspace, m+1"
        "$mod, I, workspace, m-1"

        "$mod, Space, global, caelestia:launcher"
        "$mod, A, global, caelestia:showall"
        "$mod $alt, Q, global, caelestia:lock"
        ", XF86Lock, exec, global caelestia:lock"
      ];
    };
  };
}
