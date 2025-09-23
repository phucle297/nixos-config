{
  programs.nixvim.plugins = {
    better-escape = {
      enable = true;
      lazyLoad.settings.event = "InsertEnter";
      settings = {
        default_mappings = false; # setting this to false removes all the default mappings
        mappings = {
          i = {
            k = {
              j = "<Esc>";
              k = "<Esc>";
            };
            j = {
              k = "<Esc>";
              j = "<Esc>";
            };
          };
        };
      };
    };
    fzf-lua = {
      enable = true;
      settings = {
        oldfiles = {
          include_current_sessions = true;
        };
        previewers = {
          syntax_limit_b = 1024 * 100; # 100KB
        };
      };
    };
    # yazi = {
    #   enable = true;
    #   lazyLoad.settings.keymap = [
    #     "<leader>e"
    #   ];
    # };
    neo-tree = {
      enable = true;
      window = {
        mappings = {
          "c" = "copy_to_clipboard";
          "x" = "cut_to_clipboard";
          "p" = "paste_from_clipboard";
        };
      };
    };
    leap = {
      enable = true;
      equivalenceClasses = [
        ''

        ''
        ")]}>"
        "([{<"
        [
          "\""
          "'"
          "`"
        ]
      ];
    };
    bufferline = {
      enable = true;
    };
    neo-tree-nvim = {
      enable = true;
      settings = {
        filesystem = {
          use_libuv_file_watcher = true;
          follow_current_file = true;
          hijack_netrw_behavior = "open_current";
        };
        window = {
          mappings = {
            "c" = "copy_to_clipboard";
            "x" = "cut_to_clipboard";
            "p" = "paste_from_clipboard";
          };
        };
      };
    };
    # floaterm = { enable = true; settings = { keymap_toggle = "<A-i>"; shell = "fish"; title = null;
    #   };
    # };

    # toggleterm = {
    #   enable = true;
    #   settings = {
    #     size = 20;
    #     hide_numbers = true;
    #     shade_filetypes = { };
    #     shade_terminals = true;
    #     shading_factor = 1;
    #     start_in_insert = true;
    #     insert_mappings = true;
    #     persist_size = true;
    #     direction = "horizontal";
    #     close_on_exit = true;
    #     # shell = vim.o.shell;
    #     float_opts = {
    #       border = "single";
    #       # width = function()
    #       # return math.floor(vim.o.columns * 0.8)
    #       # end, -- 80% of the screen width
    #       # height = function()
    #       # return math.floor(vim.o.lines * 0.6)
    #       # end, -- 60% of the screen height
    #       # -- width = 200;
    #       # -- height = 50;
    #       winblend = 3;
    #       highlights = {
    #         border = "Normal";
    #         background = "Normal";
    #       };
    #     };
    #   };
    # };
  };
}
