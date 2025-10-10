{
  # Configure keymap in X11
  services.xserver = {
    xkb = {
      layout = "us";
      variant = ",qwerty";
      options = "ctrl:nocaps";
    };
  };

  services.kanata = {
    enable = true;
    keyboards.alice = {
      configFile = ./hhkb.kbd;
      devices = [
        "/dev/input/by-id/usb-0416_Gaming_Keyboard-event-kbd"
      ];
    };
  };

}
