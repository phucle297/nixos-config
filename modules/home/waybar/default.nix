{
  pkgs,
  config,
  ...
}:
let
  colors = config.lib.stylix.colors.withHashtag;
in
{
  home.packages = with pkgs; [
    playerctl
  ];

  programs.waybar = {
    enable = true;
    # systemd = {
    #   enable = true;
    # };
    settings = {
      mainBar = {
        reload_style_on_change = true;
        layer = "top";
        position = "top";
        modules-left = [
          # "hyprland/workspaces"
          "niri/workspaces"
          "cava"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "pulseaudio"
          "custom/uptime"
          "backlight"
          "battery"
          "network"
          "cpu"
          "memory"
          "tray"
          "custom/power"
        ];

        "niri/workspaces" = {
          "format" = "{icon}";
          "format-icons" = {
            # Named workspaces
            # (you need to configure them in niri)
            "browser" = "";
            "discord" = "";
            "chat" = "<b></b>";

            # Icons by state
            "active" = "";
            "default" = "";
          };
        };
        # Module definitions
        "hyprland/workspaces" = {
          format = "{name}: {icon}";
          format-icons = {
            "active" = "";
            "default" = "";
          };
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
          on-click = "activate";
        };

        cava = {
          "framerate" = 60;
          "sensitivity" = 10;
          "autosens" = 1;
          "bars" = 14;
          "hide_on_silence" = true;
          "format_silent" = "quiet";
          "method" = "pipewire";
          "bar_delimiter" = 0;
          "noise_reduction" = 0.77;
          "format-icons" = [
            "▁"
            "▂"
            "▃"
            "▄"
            "▅"
            "▆"
            "▇"
            "█"
          ];
          "actions" = {
            "on-click-right" = "mode";
          };
        };
        "tray" = {
          icon-size = 16;
          spacing = 10;
        };

        # Custom modules from your original config
        "custom/music" = {
          format = "  {}";
          escape = true;
          interval = 5;
          tooltip = false;
          exec = "playerctl metadata --format='{{ artist }} - {{ title }}'";
          on-click = "playerctl play-pause";
          max-length = 50;
        };

        "network" = {
          format-wifi = "{bandwidthDownBits} 󰤢 ";
          format-ethernet = "{bandwidthDownBits} 󰈀 ";
          format-disconnected = "No Network 󰤠 ";
          interval = 5;
          on-click = "gnome-control-center network";
          tooltip = false;
        };

        "cpu" = {
          interval = 1;
          format = "{usage:>2}%  ";
          format-icons = [
            " "
            "▂"
            "▃"
            "▄"
            "▅"
            "▆"
            "▇"
            "█"
          ];
        };

        "memory" = {
          interval = 30;
          format = "{used:0.1f}G/{total:0.1f}G  ";
        };

        "custom/uptime" = {
          format = "{}";
          interval = 1600;
          exec = "sh -c '(uptime -p)'";
        };

        "pulseaudio" = {
          format = "{volume}% {icon}";
          format-muted = "";
          format-icons = {
            "default" = [
              ""
              ""
              " "
            ];
          };
          on-click = "pavucontrol";
        };

        "custom/power" = {
          tooltip = false;
          on-click = "wlogout &";
          format = "⏻";
        };

        # Modules from the NixOS example to keep
        "backlight" = {
          format = "{percent}% {icon}"; # Changed to your preference
          format-icons = [
            "󰃞"
            "󰃝"
            "󰃟"
            "󰃠"
          ];
          tooltip-format = "{percent}% {icon}";
        };

        "battery" = {
          states = {
            good = 95;
            warning = 30;
            critical = 20;
          };
          format = "{capacity}% {icon}"; # Changed to your preference
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
          tooltip-format = "{time} left";
        };

        "clock" = {
          format = "{:%H:%M %a}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          "calendar" = {
            "mode" = "year";
            "mode-mon-col" = 3;
            "weeks-pos" = "right";
            "on-scroll" = 1;
            "format" = {
              "days" = "<span color='${colors.base06}'><b>{}</b></span>";
              "months" = "<span color='${colors.base0C}'><b>{}</b></span>";
              "today" = "<span color='${colors.base0A}'><b><u>{}</u></b></span>";
              "weeks" = "<span color='${colors.base0D}'><b>W{}</b></span>";
              "weekdays" = "<span color='${colors.base0E}'><b>{}</b></span>";
            };
          };
          actions = {
            "on-click" = "mode";
            "on-scroll-up" = "shift_up";
            "on-scroll-down" = "shift_down";
          };
        };
      };
    };

    # CSS styling
    style = ''
      * {
        font-family: JetbrainsMono Nerd Font;
        font-size: 10px; /* Increase this value to scale up text and other elements */
        min-height: 0; /* Increase this to make the bar taller */
        padding-right: 2px;
        padding-left: 2px;
        padding-bottom: 0px;
      }

      #waybar {
        background: transparent;
        color: #c6d0f5;
        margin: 2px 2px;
      }

      #workspaces {
        border-radius: 5px;
        margin: 5px;
        background: #101010;
        margin-left: 2px;
      }

      #workspaces button {
        color: #babbf1;
        border-radius: 5px;
        padding: 0.4rem;
      }

      #workspaces button.active {
        color: #99d1db;
        border-radius: 5px;
      }

      button {
        background: transparent;
      }

      #workspaces button:hover {
        background: #1e1e1e;
        border: 0px solid transparent;
      }

      #custom-music,
      #tray,
      #backlight,
      #clock,
      #battery,
      #pulseaudio,
      #network,
      #cpu,
      #memory,
      #custom-lock,
      #custom-power,
      #custom-uptime {
        background-color: #101010;
        padding: 0.5rem 1rem;
        margin: 5px 0;
      }

      #clock {
        color: #8caaee;
        border-radius: 5px;
      }


      #battery {
        color: #a6d189;
      }

      #battery.charging {
        color: #a6d189;
      }

      #battery.warning:not(.charging) {
        color: #e78284;
      }

      #backlight {
        color: #e5c890;
      }

      #backlight,
      #battery {
        border-radius: 0;
      }

      #pulseaudio {
        color: #ea999c;
        border-radius: 5px 0px 0px 5px;
      }


      #custom-music {
        color: #ca9ee6;
        border-radius: 5px;
      }

      #custom-lock {
        color: #babbf1;
      }

      #custom-power {
        margin-right: 1rem;
        border-radius: 0px 5px 5px 0px;
        color: #e78284;
      }

      tooltip {
        background: #101010;
        color: #c6d0f5;
        border-radius: 5px;
      }

      #workspaces button {
        padding: 0.4rem;
        border-radius: 5px;
        background: transparent;
      }
    '';
  };
}
