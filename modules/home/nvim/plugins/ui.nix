{
  programs.nixvim.plugins = {
    notify = {
      enable = true;
    };
    barbecue.enable = true;
    noice = {
      enable = true;
      settings = {
        presets.lsp_doc_border = true;
        notify.enabled = true;
        messages.enabled = true;
        lsp = {
          message.enabled = true;
          override = {
            "vim.lsp.util.convert_input_to_markdown_lines" = true;
            "vim.lsp.util.stylize_markdown" = true;
            "cmp.entry.get_documentation" = true;
          };
        };

        popupmenu = {
          enabled = true;
          backend = "nui";
        };
        format = {
          filter = {
            pattern = [
              ":%s*%%s*s:%s*"
              ":%s*%%s*s!%s*"
              ":%s*%%s*s/%s*"
              "%s*s:%s*"
              ":%s*s!%s*"
              ":%s*s/%s*"
            ];
            icon = "";
            lang = "regex";
          };
          replace = {
            pattern = [
              ":%s*%%s*s:%w*:%s*"
              ":%s*%%s*s!%w*!%s*"
              ":%s*%%s*s/%w*/%s*"
              "%s*s:%w*:%s*"
              ":%s*s!%w*!%s*"
              ":%s*s/%w*/%s*"
            ];
            icon = "󱞪";
            lang = "regex";
          };
        };
      };
    };

    dashboard = {
      enable = true;
      settings = {
        config = {
          header = [
            " ██████╗ ███████╗██████╗ ███╗   ███╗███████╗███████╗███████╗"
            " ██╔══██╗██╔════╝██╔══██╗████╗ ████║██╔════╝██╔════╝██╔════╝"
            " ██████╔╝█████╗  ██████╔╝██╔████╔██║█████╗  █████╗  ███████╗"
            " ██╔═══╝ ██╔══╝  ██╔══██╗██║╚██╔╝██║██╔══╝  ██╔══╝  ╚════██║"
            " ██║     ███████╗██║  ██║██║ ╚═╝ ██║███████╗███████╗███████║"
            " ╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝"
          ];
          shortcut = [
            {
              action = "FzfLua files";
              desc = "Files";
              group = "Label";
              icon = " ";
              icon_hl = "@variable";
              key = "f";
            }
            {
              action = "FzfLua live_grep";
              desc = "Words";
              group = "Label";
              icon = "󰍉 ";
              icon_hl = "@variable";
              key = "g";
            }
            {
              action = "FzfLua oldfiles";
              desc = "oldfiles";
              group = "Label";
              icon = "  ";
              icon_hl = "@variable";
              key = "r";
            }
          ];
        };
      };
    };
    visual-whitespace = {
      enable = true;
      lazyLoad.settings.event = "ModeChanged *:[vV\22]";
    };
    rainbow-delimiters = {
      enable = true;
    };
    origami = {
      enable = true;
      lazyLoad.settings.event = "BufEnter";
    };
    which-key.enable = true;
    fidget.enable = true;
    lualine = {
      enable = true;
      settings = {
        options = {
          globalstatus = true;
          extensions = [
            "fzf"
          ];
          disabledFiletypes = {
            statusline = [
              "dashboard"
            ];
          };
        };
        sections = {
          lualine_a = [
            {
              __unkeyed-1 = "mode";
              icon = "";
            }
          ];
          lualine_b = [
            {
              __unkeyed-1 = "branch";
              icon = "";
            }
            {
              __unkeyed-1 = "diff";
              symbols = {
                added = " ";
                modified = " ";
                removed = " ";
              };
            }
          ];
          lualine_c = [
            {
              __unkeyed-1 = "diagnostics";
              sources = [ "nvim_lsp" ];
              symbols = {
                error = " ";
                warn = " ";
                info = " ";
                hint = "󰝶 ";
              };
            }
            {
              __unkeyed-1 = "navic";
            }
          ];
          lualine_x = [
            {
              __unkeyed-1 = "filetype";
              icon_only = true;
              separator = "";
              padding = {
                left = 1;
                right = 0;
              };
            }
            {
              __unkeyed-1 = "filename";
              path = 1;
            }
            {
              __unkeyed-1.__raw = ''
                function()
                  local icon = " "
                  local status = require("copilot.api").status.data
                  return icon .. (status.message or " ")
                end,

                cond = function()
                 local ok, clients = pcall(vim.lsp.get_clients, { name = "copilot", bufnr = 0 })
                 return ok and #clients > 0
                end,
              '';
            }
          ];
          lualine_y = [
            {
              __unkeyed-1 = "progress";
            }
          ];
          lualine_z = [
            {
              __unkeyed-1 = "location";
            }
          ];
        };
      };
    };
    hlchunk = {
      enable = true;
      lazyLoad.settings.event = "BufEnter";
      settings = {
        chunk = {
          chars = {
            horizontal_line = "─";
            left_bottom = "╰";
            left_top = "╭";
            right_arrow = "─";
            vertical_line = "│";
          };
          enable = true;
          exclude_filetypes = {
            lazyterm = true;
            neo-tree = true;
          };
          style = {
            fg = "#91bef0";
          };
          use_treesitter = true;
        };
      };
    };
    highlight-colors = {
      enable = true;
      lazyLoad.settings.event = "BufEnter";
    };
  };
}
