{
  config,
  lib,
  ...
}:
with lib;
let
  binds =
    {
      suffixes,
      prefixes,
      substitutions ? { },
    }:
    let
      replacer = replaceStrings (attrNames substitutions) (attrValues substitutions);
      format =
        prefix: suffix:
        let
          actual-suffix =
            if isList suffix.action then
              {
                action = head suffix.action;
                args = tail suffix.action;
              }
            else
              {
                inherit (suffix) action;
                args = [ ];
              };

          action = replacer "${prefix.action}-${actual-suffix.action}";
        in
        {
          name = "${prefix.key}+${suffix.key}";
          value.action.${action} = actual-suffix.args;
        };
      pairs =
        attrs: fn:
        concatMap (
          key:
          fn {
            inherit key;
            action = attrs.${key};
          }
        ) (attrNames attrs);
    in
    listToAttrs (pairs prefixes (prefix: pairs suffixes (suffix: [ (format prefix suffix) ])));
in
{
  programs.niri.settings = {
    input = {
      keyboard.xkb = {
        layout = "us";
        variant = ",qwerty";
        options = "ctrl:nocaps";
      };
      focus-follows-mouse = {
        enable = true;
        max-scroll-amount = "20%";
      };
      workspace-auto-back-and-forth = true;
    };

    outputs = {
      # "DP-1" = {
      #   enable = true;
      #   mode = {
      #     width = 2560;
      #     height = 1440;
      #     refresh = 74.920;
      #   };
      #   position = {
      #     x = 1440;
      #     y = 915;
      #   };
      # };
      # "DP-2" = {
      #   enable = true;
      #   mode = {
      #     width = 2560;
      #     height = 1440;
      #     refresh = 74.920;
      #   };
      #   transform.rotation = 90;
      #   position = {
      #     x = 0;
      #     y = 0;
      #   };
      # };
      "eDP-1" = {
        enable = true;
        mode = {
          width = 2880;
          height = 1800;
          refresh = 120.00000;
        };
        position = {
          x = 0;
          y = 0;
        };
      };
    };
    workspaces = {
      # "09-spotify" = {
      #   open-on-output = "DP-1";
      #   name = "spotify";
      # };
      "03-chat" = {
        open-on-output = "DP-2";
        name = "chat";
      };
    };
    prefer-no-csd = true;
    layout = {
      gaps = 16;
      preset-column-widths = [
        { proportion = 1.0 / 6.0; }
        { proportion = 1.0 / 4.0; }
        { proportion = 1.0 / 3.0; }
        { proportion = 1.0 / 2.0; }
        { proportion = 2.0 / 3.0; }
        { proportion = 3.0 / 4.0; }
        { proportion = 5.0 / 6.0; }
      ];

      always-center-single-column = true;
      focus-ring = {
        enable = true;
        width = 4;
      };
      border.enable = false;
      shadow = {
        enable = true;
        softness = 30;
        spread = 5;
        offset = {
          x = 0;
          y = 5;
        };
      };
      tab-indicator = {
        position = "top";
        gaps-between-tabs = 10;
      };
      # for overview
      background-color = "transparent";
    };
    animations = {
      slowdown = 1.0;
    };
    overview.zoom = 0.5;
    spawn-at-startup = [
      {
        command = [
          "sh"
          "-c"
          "pgrep waybar || waybar"
        ];
      }
      # { command = [ "waybar" ]; }
      { command = [ "firefox" ]; }
      { command = [ "slack" ]; }
      { command = [ "teams-for-linux" ]; }
    ];
    window-rules = [
      {
        draw-border-with-background = false;
        geometry-corner-radius =
          let
            r = 8.0;
          in
          {
            top-left = r;
            top-right = r;
            bottom-left = r;
            bottom-right = r;
          };
        clip-to-geometry = true;
      }
      {
        matches = [
          {
            app-id = "spotify";
          }
        ];
        open-on-workspace = "spotify";
        open-maximized = true;
      }
      {
        matches = [
          {
            app-id = "thunderbird";
          }
          {
            app-id = "Slack";
          }
          {
            app-id = "teams-for-linux";
          }
        ];
        open-on-workspace = "chat";
        default-window-height.proportion = 1.0 / 3.0;
      }
      {
        matches = [
          {
            title = "^(Picture-in-Picture)$";
          }
        ];
        open-floating = true;
        default-floating-position = {
          relative-to = "bottom-right";
          x = 100;
          y = 100;
        };
      }
    ];
    layer-rules = [
      {
        matches = [
          {
            namespace = "^swww-daemon$";
          }
        ];
        place-within-backdrop = true;
      }
    ];
    gestures.dnd-edge-view-scroll = {
      trigger-width = 64;
      delay-ms = 250;
      max-speed = 12000;
    };

    binds =
      with config.lib.niri.actions;
      let
        sh = spawn "sh" "-c";
      in
      lib.attrsets.mergeAttrsList [
        {
          "Mod+Q".action = close-window;
          "Mod+M".action = maximize-column;
          "Mod+F".action = fullscreen-window;
          "Mod+Ctrl+F".action = switch-focus-between-floating-and-tiling;
          "Mod+Shift+F".action = toggle-window-floating;

          "Mod+Comma".action = consume-window-into-column;
          "Mod+Period".action = expel-window-from-column;

          "Mod+R".action = switch-preset-column-width;
          # "Mod+C".action = center-column;
          "Mod+T".action = toggle-column-tabbed-display;

          "Mod+Minus".action = set-column-width "-10%";
          "Mod+Equal".action = set-column-width "+10%";
          "Mod+Shift+Minus".action = set-window-height "-10%";
          "Mod+Shift+Equal".action = set-window-height "+10%";
          "Mod+A".action = toggle-overview;

          "Mod+Return".action = spawn "kitty";
          "Mod+O".action = spawn "firefox";

          "Mod+Space".action = sh "pkill rofi || rofi -show drun -replace -i";
          "Mod+Ctrl+Q".action = sh "pkill rofi || rofi -show rofi-power-menu";
          "Mod+P".action = sh "pkill rofi || rofi-pass";
          "Mod+Ctrl+Alt+L".action = sh "hyprlock";
          "Mod+Shift+S".action = sh "flameshot gui";
          "Mod+N".action = sh "networkmanager_dmenu";
          "Mod+B".action = sh "bzmenu -l rofi";

          "XF86AudioRaiseVolume".action = sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+";
          "XF86AudioLowerVolume".action = sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
          "XF86AudioMute".action = sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

          "Mod+WheelScrollDown".action = focus-workspace-down;
          "Mod+WheelScrollUp".action = focus-workspace-up;
          "Mod+Shift+WheelScrollDown".action = focus-column-right;
          "Mod+Shift+WheelScrollUp".action = focus-column-left;

          # named workspace
          "Mod+0".action = focus-workspace "spotify";
          "Mod+C".action = focus-workspace "chat";
        }
        (binds {
          suffixes = builtins.listToAttrs (
            map (n: {
              name = toString n;
              value = [
                "workspace"
                n
              ];
            }) (range 1 9)
          );
          prefixes."Mod" = "focus";
          prefixes."Mod+Shift" = "move-window-to";
        })
        (binds {
          suffixes."H" = "column-left";
          suffixes."J" = "window-down";
          suffixes."K" = "window-up";
          suffixes."L" = "column-right";
          prefixes."Mod" = "focus";
          prefixes."Mod+Shift" = "move";
          prefixes."Mod+Ctrl" = "focus-monitor";
          prefixes."Mod+Shift+Ctrl" = "move-window-to-monitor";
          substitutions."monitor-column" = "monitor";
          substitutions."monitor-window" = "monitor";
        })
        (binds {
          suffixes."U" = "workspace-down";
          suffixes."I" = "workspace-up";
          prefixes."Mod" = "focus";
          prefixes."Mod+Shift" = "move-window-to";
          prefixes."Mod+Ctrl" = "move";
        })
      ];
  };
}
