{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    openconnect
    gpclient
    gpauth
  ];
}
