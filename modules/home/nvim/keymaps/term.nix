{
  programs.nixvim.keymaps = [
    {
      action = "<cmd>ToggleTerm direction=float<CR>";
      key = "<leader>tf";
      mode = "n";
      options = {
        silent = true;
        desc = "ToggleTerm float terminal";
      };
    }
    {
      action = "<cmd>ToggleTerm direction=horizontal<CR>";
      key = "<leader>th";
      mode = "n";
      options = {
        silent = true;
        desc = "ToggleTerm horizontal terminal";
      };
    }
    {
      action = "<cmd>ToggleTerm direction=vertical<CR>";
      key = "<leader>tv";
      mode = "n";
      options = {
        silent = true;
        desc = "ToggleTerm vertical terminal";
      };
    }
  ];
}
