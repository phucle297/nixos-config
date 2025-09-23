{
  programs.nixvim.keymaps = [
    {
      action = ":GitBlameToggle<CR>";
      key = "<leader>gb";
      mode = "n";
      options = {
        silent = true;
        desc = "Show git blame";
      };
    }
    {
      action = ":Tinygit interactiveStaging<CR>";
      key = "<leader>gt";
      mode = "n";
      options = {
        silent = true;
        desc = "Tinygit interactiveStaging";
      };
    }
    {
      action = ":Tinygit smartCommit<CR>";
      key = "<leader>gci";
      mode = "n";
      options = {
        silent = true;
        desc = "Tinygit commit message";
      };
    }
    {
      action = ":Tinygit amendNoEdit<CR>";
      key = "<leader>gca";
      mode = "n";
      options = {
        silent = true;
        desc = "Tinygit commit amendNoEdit";
      };
    }
    {
      action = ":Tinygit stashPush<CR>";
      key = "<leader>gst";
      mode = "n";
      options = {
        silent = true;
        desc = "Tinygit stash";
      };
    }
    {
      action = ":Tinygit stashPop<CR>";
      key = "<leader>gsp";
      mode = "n";
      options = {
        silent = true;
        desc = "Tinygit stash pop";
      };
    }
  ];
}
