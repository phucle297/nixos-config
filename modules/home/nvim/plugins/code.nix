{
  programs.nixvim.plugins = {
    tiny-inline-diagnostic = {
      enable = true;
      lazyLoad.settings.event = "LspAttach";
      settings = {
        options = {
          use_icons_from_diagnostic = true;
        };
        preset = "modern";
        virt_texts = {
          priority = 2048;
        };
      };
    };
    lazygit = {
      enable = true;
    };
    tinygit = {
      enable = true;
      lazyLoad.settings.cmd = "Tinygit";
    };
    gitblame = {
      enable = true;
      lazyLoad.settings.keymap = [
        "<leader>gb"
      ];
      settings = {
        enabled = true;
        message_template = "<author> • <date> • <summary> • <<sha>>";
        date_format = "%m-%d-%Y %H:%M:%S";
        virtual_text_column = 1;
      };
    };
    nvim-autopairs = {
      enable = true;
      lazyLoad.settings.event = "InsertEnter";
    };
  };
}
