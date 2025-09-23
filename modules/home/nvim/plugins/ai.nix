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
        copilot_suggest_hidden = false;
        strategies = {
          chat.adapters = "copilot";
          agent.adapters = "copilot";
          inline.adapters = "copilot";
        };
      };
    };
  };
}
