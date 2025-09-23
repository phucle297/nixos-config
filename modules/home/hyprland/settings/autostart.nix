{
  wayland.windowManager.hyprland.settings."exec-once" = [
    "rfkill unblock bluetooth"
    "1password"
    "waybar &"
    "fcitx5 &"
    # GUI
    "[workspace 2 silent] firefox"
    "[workspace 3 silent] teams-for-linux"
    "[workspace 3 silent] slack"
    # "[workspace 3 silent] thunderbird"
    # "[workspace 10 silent] spotify"
  ];
}
