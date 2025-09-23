{
  imports = [
    ./buffer.nix
    ./git.nix
    ./fzf.nix
    ./noice.nix
    ./window.nix
  ];
  programs.nixvim.keymaps = [
    {
      action = ":noh<CR>";
      key = "<Esc>";
      mode = "n";
      options = {
        silent = true;
      };
    }
    # Continuous visual shifting (does not exit Visual mode), `gv` means
    {
      action = "<gv";
      key = "<";
      mode = "x";
    }
    {
      action = ">gv";
      key = ">";
      mode = "x";
    }
    {
      action = ":";
      key = ";";
      mode = "n";
    }
    {
      action = "^";
      key = "gh";
      mode = [
        "n"
        "v"
      ];
      options = {
        desc = "Go to start";
      };
    }
    {
      action = "$";
      key = "gl";
      mode = [
        "n"
        "v"
      ];
      options = {
        desc = "Go to end";
      };
    }
    # {
    #   action = ":Yazi<CR>";
    #   key = "<leader>e";
    #   mode = "n";
    #   options = {
    #     silent = true;
    #     desc = "yazi toggle";
    #   };
    # }
    {
      action = ":update<CR>";
      key = "<leader>w";
      mode = "n";
      options = {
        silent = true;
        desc = "Save buffer";
      };
    }
    {
      action = "<Esc>viwUea";
      key = "<c-u>";
      mode = "i";
      options = {
        silent = true;
        desc = "Turn the word under cursor to UPPERCASE";
      };
    }
    {
      action = "<Esc>b~lea";
      key = "<c-t>";
      mode = "i";
      options = {
        silent = true;
        desc = "Turn the current word to Titlecase";
      };
    }
    {
      action = "<cmd>:lua require('logsitter').log()<CR>";
      key = "<leader>lg";
      mode = "n";
      options = {
        silent = true;
        desc = "Log current node";
      };
    }
  ];
}
