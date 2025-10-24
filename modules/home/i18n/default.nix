{ pkgs, ... }:
{
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-gtk
        fcitx5-unikey
        fcitx5-bamboo
      ];
      settings = {
        inputMethod = {
          GroupOrder."0" = "Default";
          "Groups/0" = {
            Name = "Default";
            "Default Layout" = "us";
            DefaultIM = "bamboo";
          };
          "Groups/0/Items/0".Name = "keyboard-us";
          "Groups/0/Items/1".Name = "bamboo";
          "Groups/0/Items/2".Name = "keyboard-us-dvp";
        };
        globalOptions = {
          Behavior = {
            ActiveByDefault = true;
            # Reset state on Focus In
            resetStateWhenFocusIn = "No";
            # Share Input State
            ShareInputState = "All";
            # Show preedit in application
            PreeditEnabledByDefault = true;
            # Show Input Method Information when switch input method
            ShowInputMethodInformation = true;
            # Show Input Method Information when changing focus
            showInputMethodInformationWhenFocusIn = false;
            # Show compact input method information
            CompactInputMethodInformation = true;
            # Show first input method information
            ShowFirstInputMethodInformation = true;
            # Default page size
            DefaultPageSize = 5;
            # Override Xkb Option
            OverrideXkbOption = false;
            # Preload input method to be used by default
            PreloadInputMethod = true;
            # Allow input method in the password field
            AllowInputMethodForPassword = false;
            # Show preedit text when typing password
            ShowPreeditForPassword = false;

            DisabledAddons = true;
          };
          "Hotkey/TriggerKeys" = {
            "0" = "Control+Shift+Shift_L";
            "1" = "Control+Shift+Control_L";
            "2" = "Alt+Z";
          };
          Hotkey = {
            # Enumerate when press trigger key repeatedly
            EnumerateWithTriggerKeys = false;
            # Temporally switch between first and current Input Method
            AltTriggerKeys = "";
            # Enumerate Input Method Forward
            EnumerateForwardKeys = "";
            # Enumerate Input Method Backward
            EnumerateBackwardKeys = "";
            # Skip first input method while enumerating
            EnumerateSkipFirst = false;
            # Enumerate Input Method Group Forward
            EnumerateGroupForwardKeys = "";
            # Enumerate Input Method Group Backward
            EnumerateGroupBackwardKeys = "";
            # Activate Input Method
            ActivateKeys = "";
            # Deactivate Input Method
            DeactivateKeys = "";
            # Default Previous page
            PrevPage = "";
            # Default Next page
            NextPage = "";
            # Default Previous Candidate
            PrevCandidate = "";
            # Default Next Candidate
            NextCandidate = "";
            # Toggle embedded preedit
            TogglePreedit = "";
            # Time limit in milliseconds for triggering modifier key shortcuts
            ModifierOnlyKeyTimeout = "246";
          };

        };
        addons = {
          unicode.globalSection = {
            TriggerKey = "";
            DirectUnicodeMode = "";
          };
          keyboard.globalSection = {
            "Hint Trigger" = "";
            "One Time Hint Trigger" = "";
          };
          imselector.globalSection = {
            TriggerKey = "";
            TriggerKeyLocal = "";
            SwitchKey = "";
            SwitchKeyLocal = "";
          };
          clipboard.globalSection = {
            TriggerKey = "";
            PastePrimaryKey = "";
            # Number of entries
            "Number of entries" = 0;
            # Do not show password from password managers
            IgnorePasswordFromPasswordManager = "False";
            # Hidden clipboard content that contains a password
            "ShowPassword" = "False";
            # Seconds before clearing password
            ClearPasswordAfter = "30";

          };
          quickphrase.globalSection = {
            # Trigger Key
            TriggerKey = "";
            # Choose key modifier
            "Choose Modifier" = "None";
            # Enable Spell check
            Spell = "False";
            # Fallback Spell check language
            FallbackSpellLanguage = "en";

          };
        };
      };
    };
  };
}
