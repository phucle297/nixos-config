{ lib, ... }:
{
  programs.nixvim = {
    clipboard = {
      register = "unnamedplus";
    };
    luaLoader.enable = true;

    globals = {
      mapleader = " ";
      maplocalleader = " ";
      # Disable useless providers
      loaded_ruby_provider = 0; # Ruby
      loaded_perl_provider = 0; # Perl
      loaded_python_provider = 0; # Python 2

      # Custom for toggles
      disable_diagnostics = false;
      disable_autoformat = false;
      spell_enabled = true;
      colorizing_enabled = 1;
      first_buffer_opened = false;
    };
    filetype = {
      filename = {
        ".kbd" = "lisp";
      };
    };

    opts = {
      updatetime = 100; # Faster completion

      # Line numbers
      relativenumber = true; # Relative line numbers
      number = true; # Display the absolute line number of the current line number = true; # Display the absolute line number of the current line
      hidden = true; # Keep closed buffer open in the background
      mouse = "a"; # Enable mouse control
      mousemodel = "extend"; # Mouse right-click extends the current selection
      splitbelow = true; # A new window is put below the current one
      splitright = true; # A new window is put right of the current one

      swapfile = false; # Disable the swap file
      modeline = true; # Tags such as 'vim:ft=sh'
      modelines = 100; # Sets the type of modelines
      undofile = true; # Automatically save and restore undo history
      incsearch = true; # Incremental search: show match for partly typed search command
      ignorecase = true; # When the search query is lower-case, match both lower and upper-case patterns
      smartcase = true; # Override the 'ignorecase' option if the search pattern contains upper case characters
      cursorline = true; # Highlight the screen line of the cursor
      # signcolumn = "yes"; # Whether to show the signcolumn
      # colorcolumn = "100"; # Columns to highlight
      laststatus = 3; # When to use a status line for the last window
      fileencoding = "utf-8"; # File-content encoding for the current buffer
      termguicolors = true; # Enables 24-bit RGB color in the |TUI|
      spelllang = lib.mkDefault [ "en_us" ]; # Spell check languages
      spell = true; # Highlight spelling mistakes (local to window)
      wrap = true; # Wrap text

      # Tab options
      tabstop = 2; # Number of spaces a <Tab> in the text stands for (local to buffer)
      shiftwidth = 2; # Number of spaces used for each step of (auto)indent (local to buffer)
      softtabstop = 0; # If non-zero, number of spaces to insert for a <Tab> (local to buffer)
      expandtab = true; # Expand <Tab> to spaces in Insert mode (local to buffer)
      autoindent = true; # Do clever autoindenting

      # Disable fold, using nvim origami
      foldlevel = 99;
      foldlevelstart = 99;

      fillchars = {
        horiz = "━";
        horizup = "┻";
        horizdown = "┳";
        vert = "┃";
        vertleft = "┫";
        vertright = "┣";
        verthoriz = "╋";

        eob = " ";
        diff = "╱";

        fold = " ";
        foldopen = "";
        foldclose = "";

        msgsep = "‾";
      };

      lazyredraw = false; # Faster scrolling if enabled, breaks noice
      synmaxcol = 240; # Max column for syntax highlight
      showmatch = true; # when closing a bracket, briefly flash the matching one
      matchtime = 1; # duration of that flashing n deci-seconds
      startofline = true; # motions like "G" also move to the first char
      report = 9001; # disable "x more/fewer lines" messages
    };
  };
}
