{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.permees = {
    isNormalUser = true;
    description = "permees";
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "video"
      "rfkill"
    ];
  };
}
