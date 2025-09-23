{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "tile,title:^(Microsoft-edge)$"
      "tile,title:^(Brave-browser)$"
      "tile,title:^(Chromium)$"
      "float,class:^(pavucontrol)$"
      "float,class:^(nm-connection-editor)$"
      "float,class:^(qalculate-gtk)$"

      # Bluetooth
      "float,class:^(.blueman-manager-wrapped)$"
      "center,class:^(.blueman-manager-wrapped)$"
      "size 30%,class:^(.blueman-manager-wrapped)$"
      "float,class:^(blueberry.py)$"
      "center,class:^(blueberry.py)$"
      "size 30%,class:^(blueberry.py)$"

      # Browser Picture in Picture
      "float, title:^(Picture-in-Picture)$"
      "pin, title:^(Picture-in-Picture)$"
      "move 69.5% 4%, title:^(Picture-in-Picture)$"

      "bordersize 0, floating:0, onworkspace:w[tv1]"
      "rounding 0, floating:0, onworkspace:w[tv1]"
      "bordersize 0, floating:0, onworkspace:f[1]"
      "rounding 0, floating:0, onworkspace:f[1]"

      # idle inhibit while watching videos
      "idleinhibit focus, class:^(mpv|.+exe|celluloid)$"
      "idleinhibit focus, class:^(firefox)$, title:^(.*YouTube.*)$"
      "idleinhibit fullscreen, class:^(firefox)$"

      # screenshot
      # "move -1440 -920,class:(flameshot)"
      "move 0 0,class:(flameshot)"
      "pin,class:(flameshot)"
      "noborder,class:(flameshot)"
      "stayfocused,class:(flameshot)"
      "float,class:(flameshot)"
      "fullscreenstate,class:(flameshot),title:(flameshot)"

      # window 2
      "workspace 2, class:^(firefox)$"

      # window 3 - Chat
      "workspace 3, class:^(teams-for-linux)$"
      "workspace 3, class:^(Slack)$"

      # window 10 - Spotify
      "workspace 10, class:^(spotify)$"
    ];
    # layerrule = [
    #   # SwayNC
    #   "blur, swaync-control-center"
    #   "blur, swaync-notification-window"
    #   "ignorezero, swaync-control-center"
    #   "ignorezero, swaync-notification-window"
    #   "ignorealpha 0.5, swaync-control-center"
    #   "ignorealpha 0.5, swaync-notification-window"
    # ];
    workspace = [
      "w[tv1], gapsout:0, gapsin:0"
      "f[1], gapsout:0, gapsin:0"
      "3, layoutopt:orientation:vertical"
      "1, layoutopt:orientation:vertical"
    ];
  };
}
