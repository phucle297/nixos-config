{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 5;
      gaps_out = "0, 5, 5, 5";
      border_size = 3;
      layout = "dwindle";
      resize_on_border = true;
    };
    gestures = {
      workspace_swipe = true;
    };
    cursor = {
      hide_on_key_press = true;
    };
    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    binds = {
      workspace_back_and_forth = false;
      allow_workspace_cycles = false;
      pass_mouse_when_bound = false;
      allow_pin_fullscreen = true;
    };

    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      initial_workspace_tracking = 1;
      mouse_move_enables_dpms = true;
      key_press_enables_dpms = true;
    };
  };
}
