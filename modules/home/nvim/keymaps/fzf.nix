{ config, ... }:
let
  helpers = config.lib.nixvim;
in
{
  programs.nixvim.keymaps = [
    {
      action = ":FzfLua files<CR>";
      key = "<leader>ff";
      mode = "n";
      options = {
        silent = true;
        desc = "Fuzzy find files";
      };
    }
    {
      action = ":FzfLua live_grep<CR>";
      key = "<leader>fg";
      mode = "n";
      options = {
        silent = true;
        desc = "Fuzzy live grep";
      };
    }
    {
      action = ":FzfLua oldfiles<CR>";
      key = "<leader>fo";
      mode = "n";
      options = {
        silent = true;
        desc = "Fuzzy find old files";
      };
    }
    {
      action = ":FzfLua buffers<CR>";
      key = "<leader>fb";
      mode = "n";
      options = {
        silent = true;
        desc = "Fuzzy search opened buffers";
      };
    }
    {
      action = ":FzfLua diagnostic_document<CR>";
      key = "<leader>fd";
      mode = "n";
      options = {
        silent = true;
        desc = "Fuzzy search diagnostic in document";
      };
    }
    {
      action = ":FzfLua resume<CR>";
      key = "<leader>fr";
      mode = "n";
      options = {
        silent = true;
        desc = "Fuzzy continue last search";
      };
    }
    {
      action = ":FzfLua lsp_code_action<CR>";
      key = "<leader>ca";
      mode = "n";
      options = {
        silent = true;
        desc = "Fuzzy lsp code action";
      };
    }
    {
      action = helpers.mkRaw "function() require('fzf-lua').lsp_references() end";
      key = "gr";
      mode = "n";
      options = {
        silent = true;
        desc = "Go to lsp_references";
      };
    }
  ];
}
