{ lib, pkgs, ... }:
{
  programs.nixvim.plugins = {
    lint = {
      enable = true;
      lazyLoad.settings.event = [
        "BufWritePost"
        "BufReadPost"
        "InsertLeave"
      ];
      linters = {
        deadnix = {
          cmd = lib.getExe pkgs.deadnix;
        };
        eslint_d = {
          cmd = lib.getExe pkgs.eslint_d;
        };
        stylelint = {
          cmd = lib.getExe pkgs.stylelint;
        };
        hadolint = {
          cmd = lib.getExe pkgs.hadolint;
        };
      };
      lintersByFt = {
        javscript = [ "eslint_d" ];
        typescript = [ "eslint_d" ];
        javscriptreact = [ "eslint_d" ];
        typescriptreact = [ "eslint_d" ];
        css = [ "stylelint" ];
        text = [ "vale" ];
        markdown = [ "vale" ];
        dockerfile = [ "hadolint" ];
        terraform = [ "tflint" ];
        python = [ "pflake8" ];
        nix = [
          "deadnix"
          "nix"
        ];
      };
    };
  };
}
