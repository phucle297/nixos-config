{
  programs.nixvim.plugins = {
    luasnip.enable = true;
    blink-cmp = {
      enable = true;

      settings = {
        completion = {
          accept.auto_brackets.enabled = true;
          ghost_text.enabled = true;
          documentation = {
            auto_show = true;
            window.border = "rounded";
          };
          menu = {
            border = "rounded";
            draw = {
              columns = [
                {
                  __unkeyed-1 = "label";
                }
                {
                  __unkeyed-1 = "kind_icon";
                  __unkeyed-2 = "kind";
                  gap = 1;
                }
                { __unkeyed-1 = "source_name"; }
              ];
            };
          };
        };
        fuzzy = {
          prebuilt_binaries = {
            download = false;
            ignore_version_mismatch = true;
          };
        };
        appearance = {
          use_nvim_cmp_as_default = true;
        };
        keymap = {
          preset = "enter";
          "<Tab>" = [
            "select_next"
            "fallback"
          ];
          "<S-Tab>" = [
            "select_prev"
            "fallback"
          ];
        };
        signature = {
          enabled = true;
          window.border = "rounded";
        };
        sources = {
          default = [
            "copilot"
            # BUILT-IN SOURCES
            "lsp"
            "buffer"
            "path"
            "snippets"
          ];
          providers = {
            copilot = {
              async = true;
              module = "blink-cmp-copilot";
              name = "copilot";
              score_offset = 100;
            };
            # BUILT-IN SOURCES
            lsp.score_offset = 4;
          };
        };
      };

    };
  };
}
