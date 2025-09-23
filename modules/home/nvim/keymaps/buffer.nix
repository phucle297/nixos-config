{
  programs.nixvim.keymaps = [
    # Buffer bindings
    {
      action = ":bprev<CR>";
      key = "<S-Tab>";
      mode = "n";
      options = {
        silent = true;
      };
    }

    {
      action = ":bnext<CR>";
      key = "<Tab>";
      mode = "n";
      options = {
        silent = true;
      };
    }
    {
      action = ":bd<CR>";
      key = "<leader>bd";
      mode = "n";
      options = {
        silent = true;
        desc = "Close current buffer";
      };
    }

    {
      action = ":BufferLineCloseOther<CR>";
      key = "<leader>bo";
      mode = "n";
      options = {
        silent = true;
        desc = "Close other buffers";
      };
    }
  ];
}
