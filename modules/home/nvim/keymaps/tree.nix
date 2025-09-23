{
  programs.nixvim.keymaps = [
    {
      action = "<cmd>Neotree toggle<CR>";
      key = "<leader>e";
      options = {
        silent = true;
        desc = "Toggle file explorer";
      };
    }
  ];
}
