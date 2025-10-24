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
    yazi = {
      enable = true;
    };
    # neo-tree = {
    #   enable = true;
    #   enableDiagnostics = true;
    #   enableGitStatus = true;
    #   enableModifiedMarkers = true;
    #   enableRefreshOnWrite = true;
    #   closeIfLastWindow = true;
    #   popupBorderStyle = "rounded"; # Type: null or one of “NC”, “double”, “none”, “rounded”, “shadow”, “single”, “solid” or raw lua code
    #   buffers = {
    #     bindToCwd = false;
    #     followCurrentFile = {
    #       enabled = true;
    #     };
    #   };
    #   window = {
    #     mappings = {
    #       c = "copy_to_clipboard";
    #       x = "cut_to_clipboard";
    #       p = "paste_from_clipboard";
    #       l = "open";
    #       h = "close_node";
    #       # h.__raw = ''
    #       #   function(state)
    #       #     local node = state.tree:get_node()
    #       #     if node.type == "directory" and node:is_expanded() then
    #       #       require("neo-tree.sources.filesystem.commands").close_node(state)
    #       #     else
    #       #       require("neo-tree.sources.filesystem.commands").navigate_up(state)
    #       #     end
    #       #   end
    #       # '';
    #     };
    #   };
    # };
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
    # floaterm = { enable = true; settings = { keymap_toggle = "<A-i>"; shell = "fish"; title = null;
    #   };
    # };

    toggleterm = {
      enable = true;
      settings = {
        open_mapping = "[[<c-\\>]]";
        direction = "float";
        size = 20;
        hide_numbers = true;
        shade_terminals = true;
        shading_factor = 1;
        start_in_insert = true;
        insert_mappings = true;
        persist_size = true;
        close_on_exit = true;
        float_opts = {
          border = "curved";
          # border = "single";
          # width = function()
          # return math.floor(vim.o.columns * 0.8)
          # end, -- 80% of the screen width
          # height = function()
          # return math.floor(vim.o.lines * 0.6)
          # end, -- 60% of the screen height
          # -- width = 200;
          # -- height = 50;
          width = 130;
          height = 30;

          winblend = 3;
          highlights = {
            border = "Normal";
            background = "Normal";
          };
        };
      };
    };
  };
}
