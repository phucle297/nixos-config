{
  security.pam.services.hyprlock = { };
  # security.pki.certificateFiles = [ ../../cert.crt ];
  # # TODO: gc cleanup old cert files
  # nix.settings.ssl-cert-file = "/etc/ssl/certs/cert.crt";
  #
  # environment.sessionVariables = {
  #   SSL_CERT_FILE = "/etc/ssl/certs/ca-certificates.crt";
  #   NIX_SSL_CERT_FILE = "/etc/ssl/certs/ca-certificates.crt";
  #   CURL_CA_BUNDLE = "/etc/ssl/certs/ca-certificates.crt";
  #   GIT_SSL_CAINFO = "/etc/ssl/certs/ca-certificates.crt";
  # };
}
