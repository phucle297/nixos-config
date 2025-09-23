{ pkgs, ... }:
{
  home.packages = [
    (pkgs.writeShellScriptBin "kitty-pager" (builtins.readFile ./kitty-pager.sh))
  ];

  programs.kitty = {
    enable = true;
    shellIntegration = {
      mode = null;
    };
    enableGitIntegration = true;
    settings = {
      font_size = "14";
      shell = "fish";
      cursor_shape = "block";
      cursor_blink_interval = "0";
      cursor_trail = "1";
      cursor_trail_decay = "0.1 0.4";
      cursor_trail_start_threshold = "10";
      scrollback_lines = "200000";
      scrollback_pager = "kitty-pager 'INPUT_LINE_NUMBER' 'CURSOR_LINE' 'CURSOR_COLUMN'";
      mouse_hide_wait = "-1";
      enable_audio_bell = "no";
      window_padding_width = "10";
      clear_all_shortcuts = "yes";
    };
    keybindings = {
      "kitty_mod" = "ctrl+shift";
      "kitty_mod+c" = "copy_to_clipboard";
      "kitty_mod+v" = "paste_from_clipboard";
      "kitty_mod+k" = "scroll_line_up";
      "kitty_mod+j" = "scroll_line_down";
      "kitty_mod+u" = "scroll_page_up";
      "kitty_mod+d" = "scroll_page_down";
      "kitty_mod+enter" = "new_os_window_with_cwd";
      "kitty_mod+r" = "load_config_file";
      "kitty_mod+equal" = "change_font_size all +2.0";
      "kitty_mod+minus" = "change_font_size all -2.0";
      "kitty_mod+backspace" = "change_font_size all 0";
      "kitty_mod+o" = "open_url_with_hints";
      "kitty_mod+h" =
        "launch --type overlay --stdin-source=@screen_scrollback --stdin-add-formatting kitty-pager";
    };
  };
}
