{
  programs.nixvim.keymaps = [
    {
      action = ":NoiceDismiss<CR>";
      key = "<leader>nd";
      mode = "n";
      options = {
        silent = true;
        desc = "Dismiss noice notification";
      };
    }
    {
      action = ":Noice fzf<CR>";
      key = "<leader>fn";
      mode = "n";
      options = {
        silent = true;
        desc = "Find notification";
      };
    }
  ];
}
