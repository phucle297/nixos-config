{
  programs.nixvim.plugins = {
    blink-cmp-copilot = {
      enable = true;
    };
    copilot-lua = {
      enable = true;
    };
    codecompanion = {
      enable = true;
      settings = {
        strategies = {
          chat.adapters = "copilot";
          agent.adapters = "copilot";
          inline.adapters = "copilot";
        };
      };
    };
  };
}
