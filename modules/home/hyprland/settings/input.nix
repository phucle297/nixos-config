{ ... }:
{
  wayland.windowManager.hyprland.settings.input = {
    kb_layout = "us";
    kb_variant = ",qwerty";
    kb_model = "";
    kb_options = "ctrl:nocaps";
    numlock_by_default = true;
    mouse_refocus = false;

    follow_mouse = 1;
    touchpad = {
      # for laptop
      natural_scroll = "yes";
      middle_button_emulation = true;
      clickfinger_behavior = false;
      scroll_factor = 1.0;
    };
    sensitivity = 0; # Pointer speed: -1.0 - 1.0, 0 means no modification.
  };
}
