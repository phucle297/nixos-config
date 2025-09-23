{ pkgs, ... }:
{
  home.packages = [
    (pkgs.writeShellScriptBin "focus-or-open" (builtins.readFile ./scripts/focus-or-open.sh))
  ];
  wayland.windowManager.hyprland = {
    settings = {
      "$mod" = "SUPER";
      "$alt" = "ALT";
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      bind = [
        "$mod, RETURN, exec, kitty"
        "$mod, O, exec, focus-or-open zen class:zen"
        "$mod, Q, killactive"
        "$mod, F, fullscreen, 0"
        "$mod, M, fullscreen, 1"
        "$mod SHIFT, F, togglefloating"
        "$alt, H, changegroupactive, b"
        "$alt, L, changegroupactive, f"
        "$mod, T, togglegroup"
        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"
        "$mod CTRL, H, movewindoworgroup, l"
        "$mod CTRL, L, movewindoworgroup, r"
        "$mod CTRL, K, movewindoworgroup, u"
        "$mod CTRL, J, movewindoworgroup, d"
        "$mod CTRL, R, exec, hyprctl reload"
        "$mod SHIFT, S, exec, flameshot gui"
        "$mod, SPACE, exec, pkill rofi || rofi -show drun -replace -i"
        ", XF86MonBrightnessUp, exec, brightnessctl -q s +10%"
        ", XF86MonBrightnessDown, exec, brightnessctl -q s 10%-"
        ", XF86AudioRaiseVolume, exec, pamixer -i 10"
        ", XF86AudioLowerVolume, exec, pamixer -d 10"
        ", XF86AudioMute, exec, pamixer -t"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPause, exec, playerctl pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl prev"
        ", XF86Lock, exec, hyprctl lock"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (
          builtins.genList
            (
              i:
              let
                ws = i + 1;
              in
              [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            ) 10
        )
      );

    };
    extraConfig = ''
      binde = $mod SHIFT, l, resizeactive, 100 0
      binde = $mod SHIFT, h, resizeactive, -100 0
      binde = $mod SHIFT, k, resizeactive, 0 -100
      binde = $mod SHIFT, j, resizeactive, 0 100
    '';
  };
}
