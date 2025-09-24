{
  wayland.windowManager.hyprland.settings."exec-once" = [
    "rfkill unblock bluetooth"
    "swww-daemon"
    "swww img ~/Pictures/wallpapers/horizontal.jpg"
    "waybar &"
    "fcitx5 &"
    # GUI
    "[workspace 1 silent] kitty"
    "[workspace 2 silent] zen"
    "[workspace 3 silent] teams-for-linux"
    "[workspace 3 silent] slack"
    "[workspace 3 silent] thunderbird"
    "[workspace 4 silent] 1password"
  ];
}
