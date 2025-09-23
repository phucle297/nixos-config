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
    systemd = {
      enable = true;
    };
    settings = {
      mainBar = {
        layer = "top";
        margin-bottom = 10;
        margin-top = 10;
        spacing = 6;
        reload_style_on_change = true;
        modules-left = [
          "hyprland/workspaces"
          "cpu"
          "memory"
          "disk"
          "cava"
        ];
        modules-center = [ "mpris" ];
        modules-right = [
          "bluetooth"
          "network"
          "battery"
          "backlight"
          "pulseaudio"
          "clock"
        ];
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
        backlight = {
          format = "{icon}";
          tooltip-format = "{percent}% {icon}";
          format-icons = [
            "󰃞"
            "󰃝"
            "󰃟"
            "󰃠"
          ];
        };
        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 20;
          };
          format = "{icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };

        pulseaudio = {
          scroll-step = 5;
          format = "{icon} {volume}%";
          format-muted = "{icon} 0%";
          on-click = "pamixer -t";
          format-icons = {
            headphone = "";
            hands-free = "󱡏";
            headset = "󱡏";
            phone = "";
            portable = "󰓃";
            car = " ";
            default = [
              ""
              ""
              ""
            ];
          };
        };
        bluetooth = {
          format = "";
          format-disabled = "󰂲";
          tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          on-click = "bzmenu -l rofi";
        };
        network = {
          format-wifi = "";
          format-ethernet = "";
          tooltip-format = "{essid} ({signalStrength}%)";
          format-disconnected = "⚠";
          interval = 1;
          on-click = "networkmanager_dmenu";
        };
        disk = {
          interval = 60;
          format = " {percentage_used}%";
          path = "/";
          tooltip = true;
          tooltip-format = "{used} / {total}";
          warning = 80;
          critical = 90;
        };
        clock = {
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
        cpu = {
          interval = 15;
          format = " {usage}%";
          max-length = 10;
        };
        memory = {
          interval = 30;
          format = " {}%";
          max-length = 10;
        };
        mpris = {
          interval = 1;
          format = "{title} - <i>{artist}</i>";
          # format-paused = "{title} - {artist}";
          title-len = 40;
          artist-len = 20;
          player-icons = {
            default = "▶";
            mpv = "🎵";
          };
          status-icons = {
            paused = "⏸";
          };
          # "ignored-players"= ["firefox"];
        };
        "custom/launcher" = {
          format = " ";
          on-click = "rofi -show drun";
          on-click-right = "killall rofi";
        };
        "custom/power" = {
          format = " ";
          on-click = "rofi -show rofi-power-menu";
        };
        "hyprland/workspaces" = {
          format = "{icon}";
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
          on-click = "activate";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "󰙯";
            "6" = "";
            "10" = "";
            "active" = "";
            "default" = "";
          };
        };
      };
    };
    style = ''
      * {
        font-family: "JetBrainsMonoNerdFont";
        font-size: 12px;
      }

      tooltip {
        background: @base01;
      }

      .modules-left,
      .modules-right,
      .modules-center {
        margin: 0 8px;
        padding: 0 1rem;
        border-radius: 3rem;
        color: @base07;
        background: @base01;
      }

      .disabled,
      .muted,
      .off {
        color: @base04;
      }

      .modules-right {
        padding-left: 1rem;
        padding-right: 0;
      }

      .modules-left {
        padding-left: 0;
        padding-right: 1rem;
      }

      #workspaces {
        border-radius: 3rem;
        background: @base02;
      }

      #workspaces button {
        background: transparent;
        border-radius: 3rem;
      }

      .modules-left #workspaces button,
      .modules-left #workspaces button.focused,
      .modules-left #workspaces button.active {
        border: 0;
      }
      #workspaces button.focused,
      #workspaces button.active,
      #workspaces button:hover
      {
        color: @base00;
        background: @base0C;
      }

      #workspaces button.urgent {
        color: @base00;
        background: @base09;
      }

      #clock {
        border-radius: 3rem;
        color: @base00;
        background: @base0C;
      }

      /* Using steps() instead of linear as a timing function to limit cpu usage */
      #battery.critical:not(.charging) {
        color: @base07;
        background: @base08;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: steps(12);
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      @keyframes blink {
        to {
          background-color: @base07;
          color: @base08;
        }
      }
    '';
  };

}
