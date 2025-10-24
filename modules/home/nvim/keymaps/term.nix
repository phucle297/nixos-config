{
  programs.nixvim.keymaps = [
    {
      action = ":ToggleTerm direction=float<CR>";
      key = "<leader>tf";
      mode = "n";
      options = {
        silent = true;
        desc = "ToggleTerm float terminal";
      };
    }
    {
      action = ":ToggleTerm direction=horizontal<CR>";
      key = "<leader>th";
      mode = "n";
      options = {
        silent = true;
        desc = "ToggleTerm horizontal terminal";
      };
    }
    {
      action = ":ToggleTerm direction=vertical<CR>";
      key = "<leader>tv";
      mode = "n";
      options = {
        silent = true;
        desc = "ToggleTerm vertical terminal";
      };
    }
  ];
}
