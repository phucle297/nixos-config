{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      inlayHints = true;
      luaConfig = {
        post = ''
          vim.diagnostic.config({ 
            underline = false,
            virtual_text = false,
            virtual_lines = false,
            float = {
              source = true,
              header = "Diagnostics:",
              prefix = " ",
              border = "single",
            },
          })
        '';
      };

      keymaps = {
        lspBuf = {
          "gd" = "definition";
          "gD" = "declaration";
          "gi" = "implementation";
          "K" = "hover";
          "<leader>ca" = "code_action";
        };
        diagnostic = {
          "<leader>j" = "goto_next";
          "<leader>k" = "goto_prev";
          "gj" = "open_float";
        };
        silent = true;
      };

      servers = {
        bashls = {
          enable = true;
        };
        cssls = {
          enable = true;
        };
        html = {
          enable = true;
        };
        jsonls = {
          enable = true;
        };
        ts_ls = {
          enable = true;
          settings = {
            typescript = {
              tsserver = {
                useSyntaxServer = false;
              };
              inlayHints = {
                includeInlayParameterNameHints = "all";
                includeInlayParameterNameHintsWhenArgumentMatchesName = true;
                includeInlayFunctionParameterTypeHints = true;
                includeInlayVariableTypeHints = true;
                includeInlayVariableTypeHintsWhenTypeMatchesName = true;
                includeInlayPropertyDeclarationTypeHints = true;
                includeInlayFunctionLikeReturnTypeHints = true;
                includeInlayEnumMemberValueHints = true;
              };
            };
          };
        };
        vtsls = {
          enable = false;
          settings = {
            complete_function_calls = true;
            vtsls = {
              enableMoveToFileCodeAction = true;
              autoUseWorkspaceTsdk = true;
              experimental = {
                maxInlayHintLength = 30;
                completion = {
                  enableServerSideFuzzyMatch = true;
                };
              };
            };
            typescript = {
              tsserver = {
                # monorepo run out of memory too often :(
                maxTsServerMemory = 8192;
              };
              updateImportsOnFileMove = {
                enabled = "always";
              };
              suggest = {
                completeFunctionCalls = true;
              };
              inlayHints = {
                enumMemberValues = {
                  enabled = true;
                };
                functionLikeReturnTypes = {
                  enabled = true;
                };
                parameterNames = {
                  enabled = "all";
                };
                parameterTypes = {
                  enabled = true;
                };
                propertyDeclarationTypes = {
                  enabled = true;
                };
                variableTypes = {
                  enabled = true;
                };
              };
            };
          };
        };
        lua_ls = {
          enable = true;
        };
        marksman = {
          enable = true;
        };
        eslint.enable = true;
        dockerls.enable = true;
        nixd = {
          enable = true;
          # settings =
          #   let
          #     flake = ''(builtins.getFlake "${self}")'';
          #   in
          #   {
          #     nixpkgs = {
          #       expr = "import ${flake}.inputs.nixpkgs { }";
          #     };
          #     formatting = {
          #       command = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
          #     };
          #   };
        };
        pyright = {
          enable = true;
        };
        yamlls = {
          enable = true;
        };
      };
    };
    yaml-schema-detect = {
      enable = true;
      settings = {
        keymap = {
          refresh = "<leader>yr";
          info = "<leader>yi";
        };
      };
    };
    tailwind-tools = {
      enable = true;
    };
  };

}
