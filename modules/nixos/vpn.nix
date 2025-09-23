{ pkgs, ... }:
{
  boot.kernelModules = [ "tun" ];

  # sudo openconnect -C "cookies goes here" --script=/run/current-system/sw/bin/vpnc-script --protocol=nc --no-dtls https://sth.here
  environment.systemPackages = with pkgs; [
    openconnect
    vpnc-scripts
    unixtools.route
    unixtools.ifconfig
  ];
}
