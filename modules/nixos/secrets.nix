{ inputs
, pkgs
, config
, ...
}:
{
  imports = [
    # inputs.agenix.nixosModules.default
    # inputs.sops-nix.nixosModules.sops
  ];
  # environment.systemPackages = with pkgs; [
  #   age
  # ];

  # sops.defaultSopsFile = ../../secrets/nixos.yaml;
  # sops.age.keyFile = "/home/permees/.config/sops/age/keys.txt";
  # sops.secrets.cert = {
  #   format = "yaml";
  #   sopsFile = ../../secrets/nixos.yaml;
  # };
  # security.pki.certificates = [ "${config.sops.secrets.cert.path}" ];
}
